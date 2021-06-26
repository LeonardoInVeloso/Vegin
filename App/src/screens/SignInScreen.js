import React from 'react';
import { StyleSheet, View, Text, Image, Button, TouchableOpacity, TextInput } from 'react-native';
import colors from '../styles/colors';
import { AuthContext } from '../components/context';


function SignInScreen(props) {

  const {signIn} = React.useContext(AuthContext);

  const [data, setData] = React.useState({
      username: '',
      password: '',
      check_textInputChange: false,
      secureTextEntry: true,
      isValidUser: true,
      isValidPassword: true,
  });


  const textInputChange = (val) => {
      if( val.trim().length >= 4 ) {
          setData({
              ...data,
              username: val,
              check_textInputChange: true,
              isValidUser: true
          });
      } else {
          setData({
              ...data,
              username: val,
              check_textInputChange: false,
              isValidUser: false
          });
      }
  }

  const handlePasswordChange = (val) => {
      if( val.trim().length >= 8 ) {
          setData({
              ...data,
              password: val,
              isValidPassword: true
          });
      } else {
          setData({
              ...data,
              password: val,
              isValidPassword: false
          });
      }
  }

  const updateSecureTextEntry = () => {
      setData({
          ...data,
          secureTextEntry: !data.secureTextEntry
      });
  }

  const handleValidUser = (val) => {
      if( val.trim().length >= 4 ) {
          setData({
              ...data,
              isValidUser: true
          });
      } else {
          setData({
              ...data,
              isValidUser: false
          });
      }
  }

  const loginHandle = (username, password) => {
      signIn(username, password);  
  }


  return (
    <View style={{ width:'100%', justifyContent: 'center', alignItems: 'center' }}>
      <Image source={require('../images/vegin.png')} style = {styles.logoImage} />
      <Text style={{color: '#4c7c5c', marginTop: 15}}>Simplificando seu caminho para o veganismo</Text>
      <View style={styles.inputField}>
        <TextInput
          style={styles.textField} 
          placeholder="Email"
          placeholderTextColor="#b8b8b8"
          style={[styles.textInput, {
              color: colors.text
          }]}
          autoCapitalize="none"
          onChangeText={(val) => textInputChange(val)}
          onEndEditing={(e)=>handleValidUser(e.nativeEvent.text)}
        />
      </View>
      <View style={styles.inputField}>
        <TextInput 
          style={styles.textField}
          placeholder="Senha"
          placeholderTextColor="#b8b8b8"
          secureTextEntry={data.secureTextEntry ? true : false}
          style={[styles.textInput, {
              color: colors.text
          }]}
          autoCapitalize="none"
          onChangeText={(val) => handlePasswordChange(val)}
        />
      </View>
      <View style={styles.logButton}>
          <Button      
          onPress={()=> {loginHandle(data.username, data.password)}}
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
  },
  inputField: {
    paddingLeft: 10,
    marginTop: 20,
    width:'80%',
    height: 40,
    backgroundColor: '#ededed',
    borderWidth: 1,
    borderRadius: 4,
    borderColor: '#b8b8b8',
    justifyContent: 'center', 
  },
  textField : {
    paddingLeft: 20
  }  
});

export default SignInScreen;