import React, { Component } from 'react';
import { StyleSheet, View, Text, Image, ActivityIndicator, FlatList, ScrollView, Button, TouchableOpacity } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import jsonServer from '../api/jsonServer';
import colors from '../styles/colors';

const baseURL = jsonServer.server;

class CompanyScreen extends Component{

   constructor(props) {
    super(props);

    this.state = {
      data: {},
      isLoading: true      
    };
  }

  componentDidMount() {
    const id = this.props.route.params?.id; 
    const group = this.props.route.params?.group; 
    //Getting Dish data from server
    fetch(`${baseURL}/api/company?id=${id}&group=${group}`,{
      method: 'GET',
      headers: new Headers({
        "Accept": "application/json" 
      }),
    })
    .then((response) => response.json())
    .then((json) => {
      //Adjusting Images Full Url
      json.image = baseURL + json.image;
      json.items.forEach(element => {
        element.image = baseURL + element.image
      });
      //setting Stack Screen title
      this.setState({ ...this.state, data: json });
    })
    .catch((error) => console.log("erro"))
    .finally(() => {
      this.setState({ ...this.state, isLoading: false });
    });
  }

  onPress(id, companyName) {
    if(companyName != null){
      this.props.navigation.navigate('CompanyReport',  { id: id, group: false})
    } else {
      this.props.navigation.navigate('CompanyReport',  { id: id, group: true})
    }
  } 

  itemPress(id, companyName) {
    console.log(this.state.data);
    if(companyName != null){
      this.props.navigation.navigate('Product',  { id: id})
    } else {
      this.props.navigation.push('Company',  { id: id, group: false})
    }
  } 

  render (){
    const { data, isLoading } = this.state;
    const ingredientIconColor = data.animal_ing == 0 ? colors.primaryColor : data.animal_ing == 1 ? colors.noVegan : colors.noInfo;
    const testIconColor = data.animal_event == 0 ? colors.primaryColor : data.animal_event == 1 ? colors.noVegan : colors.noInfo;
    const eventIconColor = data.animal_event == 0 ? colors.primaryColor : data.animal_event == 1 ? colors.noVegan : colors.noInfo;
    return (
      isLoading ? <View style={styles.activity}><ActivityIndicator size="large" color={colors.primaryColor}/></View> : (
        <View style={{ width: '100%' }}>
          <ScrollView>
            <Image
              style={styles.image}
              source={{uri: data.image}}            
            />
            <View style={styles.itemTitle}>
              <Text style={styles.itemName}>{data.name}</Text>
              <Text style={styles.itemCompany}>{data.companyGroupName}</Text>
            </View>
            <View style={styles.veganInfo}>
              <View style={{alignItems: 'center',  width: "33%"}}>
                <Ionicons name="leaf" size={18} color={ingredientIconColor}/>
                <Text style={styles.emptyCommentsText}>Produtos</Text>
              </View>
              <View style={{alignItems: 'center', width: "33%"}}>
                <Ionicons name="flask" size={18} color={testIconColor}/>
                <Text style={styles.emptyCommentsText}>Testes</Text>
              </View>
              <View style={{alignItems: 'center', width: "33%"}}>
                <Ionicons name="paw" size={18} color={eventIconColor}/>
                <Text style={styles.emptyCommentsText}>Eventos</Text>
              </View>
            </View>
            <View style={styles.separator}/> 
            <Text style={styles.obsRow}>OBSERVAÇÕES</Text>
            <View style={styles.separator}/> 
            <View style={styles.obsContainer}>
              <Text style={styles.obsText}>{data.notes}</Text>
            </View>            
            <View style={styles.separator}/> 
            <Text style={styles.obsRow}>ÚLTIMA ATUALIZAÇÃO</Text>
            <View style={styles.separator}/>
            <Text style={styles.updateText}>{data.lastUpdate}</Text>
            <View style={styles.separator}/>
            <Text style={styles.obsRow}>MARCAS</Text>
            <View style={styles.separator}/>
            <View style={{flex:1, marginLeft: 10}}>
              <FlatList
                numColumns={4}
                data={data.items}
                keyExtractor={({ id }, index) => id + ''}
                renderItem={({ item }) => (
                  <TouchableOpacity style={styles.container} onPress={() => this.itemPress(item.id, data.companyGroupName)}>
                    <Image style={styles.miniature} source={{uri: item.image}}/>                   
                  </TouchableOpacity>
                )}
              />
            </View>
            <View style={styles.logButton}>
              <Button      
              onPress={()=> {this.onPress(data.id, data.companyGroupName)}}
              title="Reportar"
              color= {colors.primaryColor} 
              accessibilityLabel="Reportar"
              />
            </View>
          </ScrollView>                                   
        </View>
      )
    );
  }
};

const styles = StyleSheet.create({  
  image: {
    width: '100%',
    height: 150,
    resizeMode: 'center',
    marginTop: 15
  },
  itemTitle:{
    marginTop: 2
  },
  veganInfo: {
    marginTop: 20,
    marginLeft: 10,
    marginBottom: 15,
    flexDirection:'row',
    flexWrap: 'wrap'
  },  
  itemName: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#7d7d7d',
    textAlign: 'center'
  },
  itemCompany: {
    marginTop: 2,
    fontSize: 15,
    textAlign: 'center',
    color: "#a1a1a1",
  },
  obsRow: {
    color: colors.primaryColor,
    fontSize: 12,
    marginLeft: 15,
    marginTop: 5,
    marginBottom: 5,
    fontWeight: 'bold'    
  },
  obsContainer:{
    alignItems:'center',
    width:'100%'
  },
  obsText:{
    marginTop: 10,
    marginBottom: 10,
    fontSize: 14,
    width: '90%',
    color: colors.noInfo,
  },
  updateText:{
    marginTop: 10,
    marginBottom: 10,
    marginLeft: 15,
    fontSize: 14,
    color: colors.noInfo,
  },
  separator: {
    marginVertical: 8,
    borderBottomColor: '#ccc',
    borderBottomWidth: StyleSheet.hairlineWidth,
    width: '100%'
  },     
  emptyCommentsText: {
    color: colors.noInfo,
    fontSize: 14,
    marginTop: 2   
  },  
  activity: {
    flex:1,
    justifyContent:'center',
    alignItems:'center'
  },
  logButton:{
    marginTop: 10,
    justifyContent:'center',
    width: "100%",
  },
  container: {
    alignItems: 'center', 
    flexDirection:'row',
    flexWrap: 'wrap', 
    marginLeft: 5, 
    marginBottom: 2
  },
  miniature: {
    height: 80, 
    width: 80, 
    resizeMode: 'cover'
  }
});

export default CompanyScreen;