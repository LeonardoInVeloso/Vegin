import React, { Component } from 'react';
import { StyleSheet, View, Text, Image, ActivityIndicator, FlatList, ScrollView, Button, Dimensions, TouchableOpacity, Alert } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import jsonServer from '../api/jsonServer';
import AsyncStorage from '@react-native-async-storage/async-storage';
import MapView, {PROVIDER_GOOGLE, Marker} from 'react-native-maps';
import { AirbnbRating } from 'react-native-elements';
import colors from '../styles/colors';

const baseURL = jsonServer.server;
//Fix needed for rating works
let id = null;
class RestaurantScreen extends Component{

   constructor(props) {
    super(props);

    this.state = {
      data: {},
      isLoading: true      
    };
  }

  componentDidMount() {
    id = this.props.route.params?.id;    
    const location = this.props.route.params?.location; 
    //Getting Dish data from server
    fetch(`${baseURL}/api/establishment?id=${id}&location=${location}`,{
      method: 'GET',
      headers: new Headers({
        "Accept": "application/json" 
      }),
    })
    .then((response) => response.json())
    .then((json) => {
      //Adjusting Images Full Url
      json.image = baseURL + json.image;
      json.dishes.forEach(element => {
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

  onPress(id) {
    this.props.navigation.navigate('RestaurantReport',  { id: id})
  } 

  onAddPress() {
    this.props.navigation.navigate('DishAdd',  { id: id})
  } 

  itemPress(id) {    
    this.props.navigation.push('Dish',  { dishId: id})   
  } 
  
  async ratingCompleted(rating) {
    const token = await AsyncStorage.getItem('userToken');
    // Preparing request data
    requestData = {
        value: rating,
        establishment_id: id
    };

    fetch(`${baseURL}/api/establishment/rate`,{
      method: 'POST',
      body: JSON.stringify(requestData),
      headers: new Headers({
        "Authorization": "Bearer " + token, 
        "Accept": "application/json",
        "Content-Type" : "application/json", 
      }),
    })
    .then((response) => Alert.alert("Avaliação realizada!"))    
    .catch((error) => Alert.alert("Erro ao avaliar restaurante"));    
  };

  render (){
    const { data, isLoading } = this.state;    
    const types = ['Onívoro', 'Vegetariano', 'Vegano', 'Carnívoro']
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
            </View>
            <View style={styles.veganInfo}>
              <View style={{alignItems: 'center',  width: "33%"}}> 
                <Text style={styles.textInfo}>{types[data.type]}</Text>               
                <Text style={styles.emptyCommentsText}>Tipo</Text>
              </View>
              <View style={{alignItems: 'center', width: "33%"}}> 
                <Text style={styles.textInfo}>{data.dishes.length}</Text>                 
                <Text style={styles.emptyCommentsText}>Pratos</Text>
              </View>
              <View style={{alignItems: 'center', width: "33%"}}>  
                <AirbnbRating 
                  reviewSize={15}                 
                  ratingCount={5}
                  defaultRating={data.rating}
                  reviews={["Pessimo", "Ruim", "Ok", "Bom", "Ótimo"]}
                  size={15}
                  showRating = {false}  
                  style={{fontSize: 10}}  
                  onFinishRating={this.ratingCompleted}             
                />
                <Text style={styles.emptyCommentsText}>Avaliação</Text>
              </View>
            </View>
            <View style={styles.separator}/> 
            <Text style={styles.obsRow}>OBSERVAÇÕES</Text>
            <View style={styles.separator}/> 
            <View style={styles.obsContainer}>
              <Text style={styles.obsText}>{data.notes}</Text>
            </View>
            <View style={styles.separator}/> 
            <Text style={styles.obsRow}>LOCALIZAÇÃO</Text>
            <View style={styles.separator}/> 
            <View style={{ height: 200,justifyContent: 'center', alignItems: 'center' }}>
              <MapView 
                style={styles.map}
                provider={PROVIDER_GOOGLE} 
                showsUserLocation={true}
                region={{
                  latitude: parseFloat(data.coordinates.lat),
                  longitude: parseFloat(data.coordinates.lng),                  
                  latitudeDelta: 0.002,
                  longitudeDelta: 0.002
                }}>
                 <Marker
                  coordinate={{ latitude: parseFloat(data.coordinates.lat), longitude: parseFloat(data.coordinates.lng)}} 
                  title={data.name}                 
                >
                </Marker>
              </MapView>
            </View>
            <View style={styles.separator}/> 
            <Text style={styles.obsRow}>ÚLTIMA ATUALIZAÇÃO</Text>
            <View style={styles.separator}/>
            <Text style={styles.updateText}>{data.lastUpdate}</Text>
            <View style={styles.separator}/>
            <Text style={styles.obsRow}>PRATOS</Text>
            <View style={styles.separator}/>
            <View style={{flex:1, marginLeft: 10, flexDirection:'row', alignItems:'center'}}>
              <FlatList
                numColumns={4}
                data={data.dishes}
                keyExtractor={({ id }, index) => id + ''}
                renderItem={({ item }) => (
                  <TouchableOpacity style={styles.container} onPress={() => this.itemPress(item.id)}>
                    <Image style={styles.miniature} source={{uri: item.image}}/>                   
                  </TouchableOpacity>
                )}
              />
            </View>
            <View style={styles.logButton}>
              <Button      
              onPress={()=> {this.onPress(data.id)}}
              title="Reportar"
              color= {colors.primaryColor} 
              accessibilityLabel="Reportar"
              />
            </View>
            <View style={styles.logButton}>
              <Button      
              onPress={()=> {this.onAddPress()}}
              title="Adicionar Prato"
              color= {colors.primaryColor} 
              accessibilityLabel="Adicionar Prato"
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
  textInfo:{
    color: '#7d7d7d',
    fontSize: 16,
  },
  map: {
    height: 200,
    width: Dimensions.get('window').width
  },
  container: {     
    marginLeft: 5, 
    marginBottom: 2
  },
  miniature: {
    height: 80, 
    width: 80, 
    resizeMode: 'cover'
  }

});

export default RestaurantScreen;