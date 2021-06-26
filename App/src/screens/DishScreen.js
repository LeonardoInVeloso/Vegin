import React, { Component } from 'react';
import {StyleSheet, View, Text, Image, ActivityIndicator, FlatList, ScrollView, LogBox, TouchableOpacity, Alert } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import jsonServer from '../api/jsonServer';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { AirbnbRating } from 'react-native-elements';
import UserComment from '../components/UserComment';
import colors from '../styles/colors';

const baseURL = jsonServer.server;

//Fix needed for rating works
let id = null;

class DishScreen extends Component{

   constructor(props) {
    super(props);

    this.state = {
      data: {},
      isLoading: true      
    };
  }

   componentDidMount() {
    id = this.props.route.params?.dishId;
    //FlatList need be into a scrollview, then i disable this warning
    LogBox.ignoreLogs(['VirtualizedLists should never be nested']);   
    //Getting Dish data from server
    fetch(`${baseURL}/api/dish/${id}`,{
      method: 'GET',
      headers: new Headers({
        "Access-Control-Allow-Headers": "Authorization", 
        "Accept": "application/json" 
      }),
    })
    .then((response) => response.json())
    .then((json) => {
      //Adjusting Images Full Url
      json.image = baseURL + json.image;
      json.userImg = baseURL + json.userImg;
      json.comments.forEach(element => {
        element.userImg = baseURL + element.userImg
      });
      //setting Stack Screen title
      this.props.navigation.setOptions({ title: json.name });
      this.setState({ ...this.state, data: json });
    })
    .catch((error) => console.log("erro"))
    .finally(() => {
      this.setState({ ...this.state, isLoading: false });
    });
  }

  onPress = () => {
      this.props.navigation.navigate('DishComments', { dishId: this.props.route.params?.dishId })
  }

  async ratingCompleted(rating) {
    const token = await AsyncStorage.getItem('userToken');
    // Preparing request data
    requestData = {
        value: rating,
        dish_id: id
    };

    fetch(`${baseURL}/api/dish/rate`,{
      method: 'POST',
      body: JSON.stringify(requestData),
      headers: new Headers({
        "Authorization": "Bearer " + token, 
        "Accept": "application/json",
        "Content-Type" : "application/json", 
      }),
    })
    .then((response) => Alert.alert("Avaliação realizada!"))    
    .catch((error) => Alert.alert("Erro na avaliação"));    
  };

  render (){
    const { data, isLoading } = this.state;
    return (
      isLoading ? <View style={styles.activity}><ActivityIndicator size="large" color={colors.primaryColor}/></View> : (
        <View style={{ width: '100%' }}>
          <ScrollView>
            <Image
              style={styles.image}
              source={{uri: data.image}}            
            />
            <View style={styles.userRow}>
              <Image
                style={styles.avatar}
                source={{uri: data.userImg}}            
              />
              <View>
                <Text style={styles.userText}>{data.user}</Text>
                <Text>{data.description}</Text>
              </View>
            </View>
            <View style={styles.ratingRow}>
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
              <Text style={styles.commentsText}>{data.nComments}  Comentários</Text>
            </View>          
            <TouchableOpacity onPress={this.onPress} style={{width:'100%'}}>
              {data.comments && data.comments.length > 0 ? 
                (<FlatList 
                  styles={{overflow: "visible"}}
                  data={data.comments}
                  keyExtractor={({ id }, index) => id + ''}
                  renderItem={({ item }) => (
                    <UserComment spacement={35} info={{item}}/>    
                  )}
                />)
                :
                <Text style={styles.emptyCommentsText}>Ainda não há comentários. Toque aqui e seja o primeiro a comentar!</Text>
              }
            </TouchableOpacity>
          </ScrollView>                                   
        </View>
      )
    );
  }
};

const styles = StyleSheet.create({
  avatar: {
    width: 50,
    height: 50,
    borderRadius: 30,
    marginRight: 10
  },
  image: {
    width: '100%',
    height: 280
  },
  userRow: {
    marginTop: 10,
    marginLeft: 10,
    marginBottom:5,
    flexDirection:'row',
    flexWrap: 'wrap'
  },
  userText: {
    fontSize: 15,
    fontWeight: 'bold'
  },
  localText: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#9c9c9c',
  },
  ratingRow:{
    flexDirection:'row',
    flexWrap: 'wrap',
    alignItems: 'center',
    marginLeft: 35,
  },
  ratingText: {
    color:'#a1a1a1',
    fontSize: 12,
    marginLeft: 5   
  },
  commentsText: {
    color:'#a1a1a1',
    fontSize: 12,
    marginLeft: 28,   
  },  
  activity: {
    flex:1,
    justifyContent:'center',
    alignItems:'center'
  },
  emptyCommentsText: {
    color:'#a1a1a1',
    fontSize: 12,
    marginLeft: 28,
    marginTop: 10   
  },  

});

export default DishScreen;