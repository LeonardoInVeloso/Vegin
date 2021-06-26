import React, { Component } from 'react';
import { StyleSheet, View, Text, Image, ActivityIndicator, FlatList, ScrollView, LogBox, TextInput, KeyboardAvoidingView, TouchableOpacity } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import AsyncStorage from '@react-native-async-storage/async-storage';
import jsonServer from '../api/jsonServer';
import UserComment from '../components/UserComment';
import colors from '../styles/colors';

const baseURL = jsonServer.server;

class DishCommentScreen extends Component{

   constructor(props) {
    super(props);

    this.state = {
      data: {},
      isLoading: true,
      text:'',
      height: 0,
      keyboardHeight: 0,
      inputHeight: 40      
    };
  }
   componentDidMount() {    
    //FlatList need be into a scrollview, then i disable this warning
    LogBox.ignoreLogs(['VirtualizedLists should never be nested']);   
    //Getting Dish data from server
    const id = this.props.route.params?.dishId;
    fetch(`${baseURL}/api/dish/comments/${id}`,{
      method: 'GET',
      headers: new Headers({
        "Access-Control-Allow-Headers": "Authorization", 
        "Accept": "application/json" 
      }),
    })
    .then((response) => response.json())
    .then((json) => {
      //Adjusting Images Full Url
      json.forEach(element => {
        element.userImg = baseURL + element.userImg
      });
      //setting State
      this.setState({ ...this.state, data: json });
    })
    .catch((error) => console.log(error))
    .finally(() => {
      this.setState({ ...this.state, isLoading: false });
    });
  }

  async makeComment(){

    this.setState({ ...this.state, isLoading: true });
    //geting token for authentication
    const token = await AsyncStorage.getItem('userToken');

    // Preparing request data
    requestData = {
        content: this.state.text,
        dish_id: this.props.route.params?.dishId
    };

    fetch(`${baseURL}/api/dish/comment`,{
      method: 'POST',
      body: JSON.stringify(requestData),
      headers: new Headers({
        "Authorization": "Bearer " + token, 
        "Accept": "application/json",
        "Content-Type" : "application/json", 
      }),
    })
    .then((response) => response.json())
    .then((json) => {
      //Updating comments data
      json.userImg = baseURL + json.userImg;
      let comments = this.state.data;
      comments.push(json);
      this.setState({ ...this.state, data: comments });
      this.setState({ ...this.state, isLoading: false });

    })
    .catch((error) => console.log(error));  
  }

  render (){
    const { data, isLoading } = this.state;
    return (
      isLoading ? <ActivityIndicator/> : (
        <View style={{ flex: 1, marginTop: 5 }}>
          <ScrollView>                    
            <View style={{width:'100%'}}>
              <FlatList 
                styles={{overflow: "visible"}}
                data={data}
                keyExtractor={({ id }, index) => id + ''}
                renderItem={({ item }) => (
                  <UserComment spacement={10} info={{item}}/>    
                )}
              />
            </View>
          </ScrollView> 
          <KeyboardAvoidingView style={styles.footer}>
            <TextInput
              {...this.props}
              multiline={true}          
              placeholder="Digite aqui seu comentário.."
              onChangeText={(text) => {
                  this.setState({ text })
              }}
              onContentSizeChange={(event) => {
                  this.setState({ height: event.nativeEvent.contentSize.height })
              }}
              style={[styles.default, styles.textBox, {height: Math.max(35, this.state.height), width: '90%'}]}
              value={this.state.text}
            />
            <TouchableOpacity onPress={this.makeComment.bind(this)} style={{justifyContent: 'center', alignItems: 'center', width: "10%"}}>         
              <Ionicons name="arrow-redo-circle-outline" size={30} color={colors.primaryColor}/>
            </TouchableOpacity>
          </KeyboardAvoidingView>                              
        </View>
      )
    );
  }
};

const styles = StyleSheet.create({

  footer:{
    borderWidth: 1,
    borderColor: '#ccc',
    padding:10,
    flexDirection:'row',
    flexWrap: 'wrap',  
    justifyContent: 'center',
  },
  textBox : {
  }

});

export default DishCommentScreen;