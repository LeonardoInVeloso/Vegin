import React, { Component } from 'react';
import { StyleSheet, ActivityIndicator, View, Text, FlatList, Image, TouchableOpacity } from 'react-native';

class CompaniesList extends Component {

  constructor(props) {
    super(props);    
  } 

  onPress = (id, companyGroup) => {
    //Temporary Fix
    if(companyGroup == "Grupo de Empresas"){
      this.props.navigation.navigate('Company',  { id: id , group: true})
    }else{
      this.props.navigation.navigate('Company',  { id: id , group: false})
    }
  }

  render() {
    return (
      <View style={{flex:1}}>
          <FlatList
            data={this.props.info}
            keyExtractor={({ name }, index) => name}
            renderItem={({ item }) => (
              <TouchableOpacity style={styles.container} onPress={() => this.onPress(item.id, item.companyGroup)}>
                <Image style={styles.miniature} source={{uri: item.image}}/>
                <View style={styles.textContainer}>
                  <Text style={styles.itemTitle} navigation= {this.props.navigation} info={{item}}>{item.name}</Text>
                  <Text style={styles.itemSubtitle} navigation= {this.props.navigation} info={{item}}>{item.companyGroup}</Text>
                </View>
              </TouchableOpacity>
            )}
          />
      </View>
    );
  }
}

const styles = StyleSheet.create({

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
    resizeMode: 'center'
  },
  textContainer:{
    marginLeft: 10
  },
  itemTitle:{
    fontSize: 18
  },
  itemSubtitle:{
    fontSize: 15, 
    color: "#9c9c9c"
  }
  
})

export default CompaniesList;