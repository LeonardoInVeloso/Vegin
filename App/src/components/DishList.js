import React, { Component } from 'react';
import { ActivityIndicator, View, Text, FlatList, Alert } from 'react-native';
import DishCard from './DishCard';
import DishAPI from '../api/DishAPI';
import axios from 'axios';
import jsonServer from '../api/jsonServer';

const baseURL = jsonServer.server;

class DishList extends Component {

  constructor(props) {
    super(props);

    this.state = {
      data: [],
      isLoading: true
    };
  }

  componentDidMount() {
    fetch(`${baseURL}/api/dishes`,{
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
        element.userImg = baseURL + element.userImg
      });
      this.setState({ ...this.state, data: json });
    })
    .catch((error) => Alert.alert("Erro de Conexão", error))
    .finally(() => {
      this.setState({ ...this.state, isLoading: false });
    });
  }

  render() {
    const { data, isLoading } = this.state;
    return (
      <View style={{width:'100%'}}>
        {isLoading ? <ActivityIndicator/> : (
        <FlatList 
          data={data}
          keyExtractor={({ name }, index) => name}
          renderItem={({ item }) => (
            <DishCard navigation= {this.props.navigation} info={{item}} />
          )}
        />
        )}
      </View>
    );
  }
}

export default DishList;