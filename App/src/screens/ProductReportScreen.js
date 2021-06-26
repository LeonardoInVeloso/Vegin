import React, { Component } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, Alert } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { ButtonGroup } from 'react-native-elements';
import colors from '../styles/colors';
import jsonServer from '../api/jsonServer';

const baseURL = jsonServer.server;

const buttons = ['Esse Produto não existe mais', 'Imagem do produto incorreta', 'Observação com dados incorretos', 'Dados sobre ingredientes de origem animal incorretos', 'Dados sobre testes em animais incorretos', 'Dados sobre patrocionio de eventos com uso de animais incorretos'];

class ProductReportScreen extends Component{

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
        product_id: id
    };

    fetch(`${baseURL}/api/report/product`,{
      method: 'POST',
      body: JSON.stringify(requestData),
      headers: new Headers({
        "Authorization": "Bearer " + token, 
        "Accept": "application/json",
        "Content-Type" : "application/json", 
      }),
    })
    .then((response) => Alert.alert("O produto foi reportado com sucesso!"))    
    .catch((error) => Alert.alert("Erro ao reportar produto"))
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
export default ProductReportScreen;