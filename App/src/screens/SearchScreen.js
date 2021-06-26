import React, { Component } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList, Image, ActivityIndicator } from 'react-native';
import { SearchBar, ButtonGroup } from 'react-native-elements';
import jsonServer from '../api/jsonServer';
import colors from '../styles/colors';
import ProductsList from '../components/ProductsList';
import CompaniesList from '../components/CompaniesList';

const baseURL = jsonServer.server;

class SearchScreen extends Component {
  constructor (props) {
    super(props);
    this.state = {
      search: '',
      selectedIndex: 0,
      isLoading: false,
      searching: false,
      data: []
    };
    this.updateIndex = this.updateIndex.bind(this)
  }
  componentDidMount() {
    this.refreshData();
    this.setState({ ...this.state, isLoading: true });

  }

  updateSearch = (search) => {
    this.setState({...this.state, search: search, searching: true});
    //Timeout is necessary to do request after state changes
    setTimeout( () => {
      this.refreshData();
    },50);
  };

  updateIndex (selectedIndex) {
    this.setState({...this.state, selectedIndex: selectedIndex, isLoading: true})
    //Timeout is necessary to do request after state changes
    setTimeout( () => {
      this.refreshData();
    },50);
  }

  refreshData () {
    if(this.state.selectedIndex == 0){
      url = baseURL + '/api/products'
    }else{
      url = baseURL + '/api/companies'
    }
    fetch(`${url}?name=${this.state.search}`,{
      method: 'GET',
      headers: new Headers({
        "Accept": "application/json" 
      }),
    })
    .then((response) => response.json())
    .then((json) => {
      //Adjusting Images Full Url
      json.forEach(element => {
        element.image = baseURL + element.image
      });
      //setting State
      this.setState({ ...this.state, data: json });
    })
    .catch((error) => console.log(error))
    .finally(() => {
      this.setState({ ...this.state, searching: false });
      this.setState({ ...this.state, isLoading: false });
    });
  }

  render(){
    const { search } = this.state;
    const buttons = ['Produtos', 'Empresas'];
    const { selectedIndex } = this.state;
    
    return (
      <View style={{ flex: 1}}>
        <SearchBar
          showLoading={this.state.searching}
          placeholder="Buscar"
          onChangeText={this.updateSearch}
          lightTheme
          value={search}
          loadingProps={{
            color: colors.primaryColor,
          }}
          leftIconContainerStyle={{
            backgroundColor: colors.searchInputColor,
          }}
          inputContainerStyle={{
            backgroundColor: colors.searchInputColor,
          }}
          inputStyle={{
            backgroundColor: colors.searchInputColor,
          }}
          containerStyle={styles.searchBarContainer}
        />  
        <ButtonGroup
          onPress={this.updateIndex}
          selectedIndex={selectedIndex}
          buttons={buttons}
          innerBorderStyle={styles.innerBorderButton}
          containerStyle={styles.buttonGroupContainer}
          activeOpacity={0.2}
          Component={TouchableOpacity}
          selectedButtonStyle={styles.selectedButton}
          selectedTextStyle={{
            color: colors.primaryColor,
          }}
        />
        {this.state.isLoading == true ? 
          <View style={{flex:1,justifyContent:'center',alignItems:'center'}}>
            <ActivityIndicator size="large" color={colors.primaryColor}/>
          </View>
          :
          (
            this.state.selectedIndex == 0 ?        
            <ProductsList navigation= {this.props.navigation} info={this.state.data}/>
            :
            <CompaniesList navigation= {this.props.navigation} info={this.state.data}/>
          )
        }
      </View>
    );
  }
}

const styles = StyleSheet.create({

  searchBarContainer:{
    height: 80,
    paddingTop: 30,
    backgroundColor: "#fff",
    borderBottomWidth: 0, //remove border between buttons and search
  },
  buttonGroupContainer: {
    height: 50,
    marginTop: 0,
    marginLeft: 0,
    width: '100%',
    borderRadius: 0,  
    borderTopWidth: 0 //remove border between buttons and search
  },
  selectedButton:{
    borderBottomWidth: 2,
    borderBottomColor: colors.primaryColor,
    backgroundColor: '#fff'
  },
  innerBorderButton:{
    color: '#fff' // Hide border between buttons
  }
})

export default SearchScreen;