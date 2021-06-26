import React from 'react';
import { StyleSheet, View, Text, Image, Button, TouchableOpacity } from 'react-native';
import colors from '../styles/colors';

function LoginScreen({navigation}) {

  return (
    <View style={{ width:'100%', justifyContent: 'center', alignItems: 'center' }}>
      <Image source={require('../images/vegin.png')} style = {styles.logoImage} />
      <Text style={{color: '#4c7c5c', marginTop: 15}}>Simplificando seu caminho para o veganismo</Text>
      <View style={styles.logButton}>
          <Button      
          onPress={()=> navigation.navigate('SignIn')}
          title="Entrar"
          color= {colors.primaryColor} 
          accessibilityLabel="Logof"
          />
      </View>
      <View style={styles.textSeparator}>
        <View style={styles.separator}></View>
        <Text style={styles.text}> OU </Text> 
        <View style={styles.separator}></View> 
      </View>
      <TouchableOpacity>
        <Text style={styles.textSignUp}>Faça o cadastro usando seu email</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  logoImage: {
    marginTop: 25,
    resizeMode : 'stretch', 
    height: 220, 
    width: 220
  },
  logButton:{
    width: "80%",
    paddingTop: 30,
    marginBottom: 30
  },
  separator: {
    marginVertical: 8,
    borderBottomColor: '#ccc',
    borderBottomWidth: StyleSheet.hairlineWidth,
    width: '40%'
  },
  textSeparator : {
    width: '80%',
    alignItems: 'center',
    flexDirection:'row',
    flexWrap: 'wrap'
  },
  text : {
    textAlign: 'center',
    width: '20%'
  },
  textSignUp:{
    marginTop: 20,
    color: colors.primaryColor
  }  
});

export default LoginScreen;