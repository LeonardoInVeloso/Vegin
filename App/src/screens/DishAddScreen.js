import React, { Component } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, Alert, TextInput, KeyboardAvoidingView, Picker, Platform, Image, Button } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { ButtonGroup } from 'react-native-elements';
import colors from '../styles/colors';
import jsonServer from '../api/jsonServer';
import { Switch } from 'react-native-elements';
import * as ImagePicker from 'expo-image-picker';


const baseURL = jsonServer.server;

const buttons = ['Esse Produto não existe mais', 'Imagem do produto incorreta', 'Observação com dados incorretos', 'Dados sobre ingredientes de origem animal incorretos', 'Dados sobre testes em animais incorretos', 'Dados sobre patrocionio de eventos com uso de animais incorretos'];

class DishAddScreen extends Component{

   constructor(props) {
    super(props);

    this.state = {
      name: null,    
      isVegan: true,
      companies: [],
      company: null,
      image: null,
      notes: null,
    };
  }

  componentDidMount() {
    (async () => {
      if (Platform.OS !== 'web') {
        const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
          alert('Sorry, we need camera roll permissions to make this work!');
        }
      } 
      fetch(`${baseURL}/api/companies/list`,{
        method: 'GET',
        headers: new Headers({
          "Accept": "application/json" 
        }),
      })
      .then((response) => response.json())
      .then((json) => {
        
        this.setState({ ...this.state, companies: json });
      })
      .catch((error) => console.log("erro"))
      .finally(() => {
        this.setState({ ...this.state, isLoading: false });
      });
            
    })();
  }

  pickImage = async (value) =>{
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.All,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    });

    console.log(result);

    if (!result.cancelled) {
      this.setState({...this.state, image: result.uri})  
    }
  }

  cancelOnPress(){
    this.props.navigation.goBack();
  }

  async reportOnPress(){
    const establishment_id = this.props.route.params?.id; 
    //geting token for authentication
    const token = await AsyncStorage.getItem('userToken');
    // Preparing request data
    requestData = {
        name: this.state.name,
        establishment_id: establishment_id,
        notes: this.state.notes,
        image: this.state.image
    };

    fetch(`${baseURL}/api/dishes`,{
      method: 'POST',
      body: JSON.stringify(requestData),
      headers: new Headers({
        "Authorization": "Bearer " + token, 
        "Accept": "application/json",
        "Content-Type" : "application/json", 
      }),
    })
    .then((response) => Alert.alert("O prato foi Cadastrado!"))    
    .catch((error) => Alert.alert("Erro ao cadastrar prato"))
    .finally(() => {
      this.props.navigation.goBack();
    });
  }  

  toggleSwitch = (value) =>{
    this.setState({...this.state, isVegan: value})  
  }

  render (){   
    const { selectedIndex } = this.state;
    return (
      <View  style={{flex: 1}}>
        <View style={{flex: 1, alignItems:'center'}}>
          <View style={styles.inputField}>
            <TextInput
            style={styles.textField} 
            placeholder="Digite o nome do prato"
            placeholderTextColor="#b8b8b8"
            style={[styles.textInput, {
                color: colors.text
            }]}
            autoCapitalize="none"
            onChangeText={(val) =>  this.setState({...this.state, name: val})}
          />
          </View>                  
          <View style={{marginTop: 20}}>
            <View style={{ borderRadius:30 }}>
              <Button style={styles.selectedButton}title="Selecionar imagem da Galera" onPress={this.pickImage} />
            </View>            
          </View>
          {this.state.image && <Image source={{ uri: this.state.image }} style={{ width: 180, height: 180, marginTop: 5 }} />}
          <View style={styles.ObsinputField}>
            <TextInput
            style={styles.textField} 
            placeholder="Comentarios"
            placeholderTextColor="#b8b8b8"
            style={[styles.textInput, {
                color: colors.text
            }]}
            autoCapitalize="none"
            onChangeText={(val) =>  this.setState({...this.state, notes: val})}
            />
          </View>
          <View style={{flex: 1}}>
          </View>
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
    height: 50, 
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
  },
  inputField: {
    paddingLeft: 10,
    marginTop: 20,
    width:'90%',
    height: 40,
    backgroundColor: '#ededed',
    borderWidth: 1,
    borderRadius: 4,
    borderColor: '#b8b8b8',
    justifyContent: 'center', 
  },
  ObsinputField: {
    paddingLeft: 10,
    marginTop: 20,
    width:'90%',
    height: 100,
    backgroundColor: '#ededed',
    borderWidth: 1,
    borderRadius: 4,
    borderColor: '#b8b8b8',
    justifyContent: 'center', 
  },
  textField : {
    paddingLeft: 20
  },
  container: {
    height: 20,
    flexDirection:'row', 
    marginTop: 20
  },
  pickerContainer: {
    flex: 1,
    marginTop: -15,
    marginLeft: 10
  },
  pickerRow: {
    height: 20,
    flexDirection:'row', 
    marginTop: 20,
    width:'90%',
  },    
})
export default DishAddScreen;