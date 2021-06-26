import React, { useState, useEffect } from 'react';
import {StyleSheet, View, Text, Button, ActivityIndicator, FlatList, TouchableOpacity, Image} from 'react-native';
import { Header, Avatar } from 'react-native-elements';
import AsyncStorage from '@react-native-async-storage/async-storage';
import colors from '../styles/colors';
import { AuthContext } from '../components/context';
import jsonServer from '../api/jsonServer';

const baseURL = jsonServer.server;

function ProfileScreen({navigation}) {

  const {signOut} = React.useContext(AuthContext);
  
  const [data, setData] = useState();
  const [isLoading, setIsLoading] = useState(true);

  
  useEffect(() => {
    async function getData(){
      //geting token for authentication
      const token = await AsyncStorage.getItem('userToken');

      fetch(`${baseURL}/api/details`,{
        method: 'GET',
        headers: new Headers({
          "Authorization": "Bearer " + token, 
          "Accept": "application/json",
          "Content-Type" : "application/json", 
        }),
      })
      .then((response) => response.json())
      .then((json) => {
        //Updating comments data
        json.image = baseURL + json.image;
        json.dishes.forEach(element => {
          element.image = baseURL + element.image
        });
        setData(json);
        setIsLoading(false);        
      })
      .catch((error) => console.log(error));  
    }
    getData();
  },[]);

  function itemPress(id) {    
    navigation.push('Dish',  { dishId: id})   
  }; 

  return (
    isLoading ? <View style={{flex:1,justifyContent:'center',alignItems:'center'}}><ActivityIndicator size="large" color={colors.primaryColor}/></View> : 
    (
      <View style={{ flex: 1}}>
        <Header
          placement="center"
          centerComponent={{ text: 'Perfil', style: { color: colors.primaryColor, fontWeight: 'bold', fontSize: 20 } }}
          containerStyle={{
            backgroundColor: '#fff',
            justifyContent: 'space-around',
            elevated: true,
            elevation: 4,
            height: "14%"
          }}
        />
        <View style={{ flex: 1, alignItems: 'center', marginTop: 20}}>
        <Avatar
          rounded
          size="xlarge"
          source={{
            uri: data.image,
          }}
        />
        <Text style={{marginTop: 20, color: '#bbb', fontSize: 16}}>{data.name}</Text>
        <Text style={{marginTop: 5, color: '#ccc', fontSize: 14}}>{data.location}</Text>
        <View style={{marginTop: 10, marginLeft: 10, flexDirection:'row', alignItems:'center'}}>
          <FlatList
            numColumns={4}
            data={data.dishes}
            keyExtractor={({ id }, index) => id + ''}
            renderItem={({ item }) => (
              <TouchableOpacity style={styles.container} onPress={() => itemPress(item.id)}>
                <Image style={styles.miniature} source={{uri: item.image}}/>                   
              </TouchableOpacity>
            )}
          />
        </View>        
        </View>
        <Button
          onPress={() => {signOut()}}
          title="Sair"
          color={colors.primaryColor}
          accessibilityLabel="Logof"
        />
      </View>
    )
  );
}

const styles = StyleSheet.create({
  container: {     
    marginLeft: 5, 
    marginBottom: 2
  },
  miniature: {
    height: 80, 
    width: 80, 
    resizeMode: 'cover'
  }
})
export default ProfileScreen;