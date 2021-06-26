import React, { Component } from 'react';
import { Text, View, StyleSheet, Button } from 'react-native';
import { BarCodeScanner } from 'expo-barcode-scanner';
import jsonServer from '../api/jsonServer';

const baseURL = jsonServer.server;

class CameraScreen extends Component {
  
  constructor(props) {
    super(props);

    this.state = {      
      hasPermission : null,
      scanned : false     
    };
  }

  componentDidMount(){
    (async () => {
      const { status } = await BarCodeScanner.requestPermissionsAsync();      
      if (status === 'granted')
        this.setState({ ...this.state, hasPermission: true });
    })();
  };
  
  handleBarCodeScanned = ({ type, data }) => {
    //Getting productId from server
      let productId = null;
      fetch(`${baseURL}/api/products/scan?barcode_id=${data}&barcode_format=${type}`,{
        method: 'GET',
        headers: new Headers({
          "Accept": "application/json" 
        }),
      })
      .then((response) => response.json())
      .then((json) => {  
         productId = json.id;
         //alert(`Bar code with type ${type} and data ${data} has been scanned! e id = ${productId}`);
        if(productId != 0){     
          this.props.navigation.navigate('Product',  { id: productId });      
        }else{
          this.props.navigation.navigate('ProductAdd', {barcode_id: data, barcode_format: type});
        }
      })
      .catch((error) => console.log(error))   
      .finally(() => {
        this.setState({ ...this.state, scanned: true });
      });  
    
  }

  render(){
    if (this.state.hasPermission === null) {
      return <Text>Requisitanto permissão para usar a Camera</Text>;
    }
    if (this.state.hasPermission === false) {
      return <Text>Sem acesso a Camera</Text>;
    }
    return (
      <View style={styles.container}>
        <BarCodeScanner
          onBarCodeScanned={this.state.scanned ? undefined : this.handleBarCodeScanned}
          style={StyleSheet.absoluteFillObject}
        />
        {this.state.scanned && <Button title={'Tap to Scan Again'} onPress={() =>  this.setState({ ...this.state, scanned: false })} />}
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'center',
  },
});


export default CameraScreen;