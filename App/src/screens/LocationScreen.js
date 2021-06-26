import React, {Component } from 'react';
import {StyleSheet, View, Text, Dimensions, Image, ActivityIndicator, Alert} from 'react-native';
import MapView, {PROVIDER_GOOGLE, Marker, Callout} from 'react-native-maps';
import * as Location from 'expo-location';
import colors from '../styles/colors';
import jsonServer from '../api/jsonServer';

const baseURL = jsonServer.server;

class LocationScreen extends Component{
  constructor(props) {
    super(props);

    this.state = {
      data: [
        //{id: 1, name: 'HareBurger', image: 'https://www.boadiversao.com.br/midia/image/hareburger-logo-2015_34003.jpg', latitude: -22.9567294, longitude: -43.1761932, dishes: 8},
        //{id: 2, name: 'Deck', image: 'https://guiademairipora.com.br/wp-content/uploads/2019/04/deck-logo.jpg', latitude: -22.9708065, longitude: -43.1836214, dishes: 5},
        ],
      isLoading: true, 
      location: {},
      errorMsg : null
    };
  }
  
  componentDidMount() {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== 'granted') {
        Alert.alert("Falta de permissão", ' A permissão para acesso de localização foi negada')
        return;
      } else {
        let location = await Location.getCurrentPositionAsync({});
        fetch(`${baseURL}/api/establishments`,{
          method: 'GET',
          headers: new Headers({
            "Access-Control-Allow-Headers": "Authorization", 
            "Accept": "application/json" 
          }),
        })
        .then((response) => response.json())
        .then((json) => {
          json.forEach(element => {
            //Adjust imgage urls path
            element.image = baseURL + element.image;
          });
          this.setState({ ...this.state, data: json });
        })
        .catch((error) => Alert.alert("Erro de Conexão", error))
        .finally(() => {
          this.setState({ ...this.state, isLoading: false, location: location});
        });
            //this.setState({ ...this.state, isLoading: false, location: location});
      }      
    })();
  }

  onPress = (id, location) => {    
    this.props.navigation.navigate('Restaurant', { id: id, location: location} );
  }

  render (){
    const { data, isLoading, location } = this.state;

    return (
      isLoading ? <View style={{flex:1,justifyContent:'center',alignItems:'center'}}><ActivityIndicator size="large" color={colors.primaryColor}/></View> : 
      (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <MapView 
            style={styles.map}
            provider={PROVIDER_GOOGLE} 
            showsUserLocation={true}
            region={{
              latitude: location.coords.latitude,
              longitude: location.coords.longitude,
              latitudeDelta: 0.05,
              longitudeDelta: 0.03
            }}>

            {
              this.state.data.map(marker => (                
                <Marker
                  key={marker.name}
                  coordinate={{ latitude: parseFloat(marker.coordinates.lat), longitude: parseFloat(marker.coordinates.lng)}}                  
                >
                  <Callout style={{alignItems: 'center'}}
                    onPress={() => this.onPress(marker.id, marker.location)}>                    
                    <View style={styles.imageContainer}>              
                      <Image
                        style={styles.restaurantImage}
                        source={{uri: marker.image}}            
                      />
                    </View>
                    <View style={styles.restaurantTexts}>
                      <Text style={styles.restaurantName}>{marker.name}</Text>
                      <Text style={styles.restaurantDishes}>{marker.dishes} pratos</Text>
                    </View>                   
                  </Callout>
                </Marker>
              ))
             }
          </MapView>
        </View>
      )
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  map: {
    flex:1,
    width: Dimensions.get('window').width
  },
  imageContainer:{
    width: 100, 
    height: 100
  },
  restaurantImage:{
    width: 100, 
    height: 100, 
    resizeMode: 'center'
  },
  restaurantTexts:{
    marginTop: 2
  },
  restaurantName: {
    textAlign: 'center', 
    fontWeight: 'bold'
  },
  restaurantDishes:{
    textAlign: 'center'
  }
});

export default LocationScreen;