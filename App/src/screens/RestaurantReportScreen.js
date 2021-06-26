import React, { Component } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { ButtonGroup } from 'react-native-elements';
import colors from '../styles/colors';
import jsonServer from '../api/jsonServer';

const baseURL = jsonServer.server;

const buttons = ['Esse restaurante não existe mais', 'Logo do restaurante incorreto', 'Observação com dados incorretos', 'Localização do restaurante incorreta', 'Tipo do restaurante incorreto', 'Pratos com ingredientes animais cadastrados'];

class RestaurantReportScreen extends Component{

   constructor(props) {
    super(props);

    this.state = {
      selectedIndex: 0,     
    };

    this.updateIndex = this.updateIndex.bind(this)
  }

  updateIndex (selectedIndex) {
    this.setState({...this.state, selectedIndex: selectedIndex})   
  }

  cancelOnPress(){
    this.props.navigation.goBack();
  }

  async reportOnPress(){
    const id = this.props.route.params?.id; 
    //geting token for authentication
    const token = await AsyncStorage.getItem('userToken');
    // Preparing request data
    requestData = {
        content: buttons[this.state.selectedIndex],
        establishment_id: id
    };

    fetch(`${baseURL}/api/report/establishment`,{
      method: 'POST',
      body: JSON.stringify(requestData),
      headers: new Headers({
        "Authorization": "Bearer " + token, 
        "Accept": "application/json",
        "Content-Type" : "application/json", 
      }),
    })
    .then((response) => Alert.alert("O restaurante foi reportado com sucesso!"))    
    .catch((error) => Alert.alert("Erro ao reportar restaurante"))
    .finally(() => {
      this.props.navigation.goBack();
    });
  }

  render (){   
    const { selectedIndex } = this.state;
    return (
      <View style={{flex: 1}}>
        <ButtonGroup
          onPress={this.updateIndex}
          selectedIndex={selectedIndex}
          buttons={buttons}
          vertical={true}
          textStyle={{
            textAlign: 'center'
          }}
          //innerBorderStyle={styles.innerBorderButton}
          containerStyle={styles.buttonGroupContainer}
          //activeOpacity={0.2}
          //Component={TouchableOpacity}
          selectedButtonStyle={styles.selectedButton}
          //selectedTextStyle={{
          //  color: colors.primaryColor,
          //}}
        />
        <View style={styles.buttonsRow}>
          <TouchableOpacity 
            style={styles.cancelButtonContainer}
            onPress={()=> {this.cancelOnPress()}}
          >
            <Text>Cancelar</Text>
          </TouchableOpacity>
          <TouchableOpacity 
            style={styles.sendButtonContainer}
            onPress={()=> {this.reportOnPress()}}
          >
            <Text style={styles.sendButtonText}>Enviar</Text>
          </TouchableOpacity>          
        </View>
      </View>      
    );
  }
}

const styles = StyleSheet.create({
  buttonGroupContainer: {
    flex: 0.9,
    marginTop: 0,
    marginLeft: 0,
    width: '100%',
    borderRadius: 0,  
    borderTopWidth: 0 //remove border between buttons and search
  },
  selectedButton:{
    backgroundColor: colors.primaryColor,
  },
  buttonsRow: {
    flex: 0.1, 
    flexDirection:'row', 
  },
  cancelButtonContainer: {
    flex: 0.5, 
    backgroundColor: '#fff', 
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius:30, 
    marginLeft: 5,
    marginRight: 5,
    marginBottom: 5
  },
  sendButtonContainer: { 
    flex: 0.5, 
    backgroundColor: colors.primaryColor, 
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius:30, 
    marginLeft: 5,
    marginRight: 5,
    marginBottom: 5
  },
  sendButtonText:{
    color: '#fff'
  }
})
export default RestaurantReportScreen;