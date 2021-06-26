import { StatusBar } from 'expo-status-bar';
import React, { useEffect } from 'react';
import { StyleSheet, Text, View, ActivityIndicator, Alert, Button } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import AsyncStorage from '@react-native-async-storage/async-storage';
import HomeScreen from './src/screens/HomeScreen';
import DishScreen from './src/screens/DishScreen';
import DishCommentScreen from './src/screens/DishCommentScreen';
import ProductScreen from './src/screens/ProductScreen';
import ProductReportScreen from './src/screens/ProductReportScreen';
import CompanyScreen from './src/screens/CompanyScreen';
import CompanyReportScreen from './src/screens/CompanyReportScreen';
import RestaurantScreen from './src/screens/RestaurantScreen'
import RestaurantReportScreen from './src/screens/RestaurantReportScreen';
import ProductAddScreen from './src/screens/ProductAddScreen'
import DishAddScreen from './src/screens/DishAddScreen'
import LoginScreen from './src/screens/LoginScreen';
import SignInScreen from './src/screens/SignInScreen';
import colors from './src/styles/colors';
import { AuthContext } from './src/components/context'
import jsonServer from './src/api/jsonServer';
import { Ionicons } from '@expo/vector-icons';

//Getting server connection
const baseURL = jsonServer.server;

//Create navigators

const Stack = createStackNavigator();

const LogInStack = createStackNavigator();


export default function App() {

  /* const [isLoading, setIsLoading] = React.useState(true);
  const [userToken, setUserToken] = React.useState(true); */
  
  const initialLoginState = {
    isLoading: true,
    userName: null,
    userToken: null
  };

  const loginReducer = (prevState, action) => {
    switch( action.type ) {
      case 'RETRIEVE_TOKEN': 
        return {
          ...prevState,
          userToken: action.token,
          isLoading: false,
        };
      case 'LOGIN': 
        return {
          ...prevState,
          userName: action.id,
          userToken: action.token,
          isLoading: false,
        };
      case 'LOGOUT': 
        return {
          ...prevState,
          userName: null,
          userToken: null,
          isLoading: false,
        };
      case 'REGISTER': 
        return {
          ...prevState,
          userName: action.id,
          userToken: action.token,
          isLoading: false,
        };
    }
  };

  const [loginState, dispatch] = React.useReducer(loginReducer, initialLoginState);

  const authContext = React.useMemo(() => ({
    signIn: async(username, password) => {
      //setUserToken('ahehe');
      //setIsLoading(false);
      let userToken;

      userToken = null;
      
      requestData = {
        email: username,
        password: password
      };

      //Server Authentication
      fetch(`${baseURL}/api/login`,{
        method: 'POST',
        body: JSON.stringify(requestData),
        headers: new Headers({
         // "Access-Control-Allow-Headers": "Authorization", 
         // "Accept": "application/json",
          "Content-Type" : "application/json", 
        }),
      })
      .then((response) => response.json())
      .then((json) => {
        //Setting Token
        userToken = json.access_token;
        if(userToken != null){
          try{
            AsyncStorage.setItem('userToken', userToken);
            dispatch({ type: 'LOGIN', id: username, token: userToken });
          } catch (e) {
            // saving error
            console.log(e);
          }
      } else {
          Alert.alert("Credenciais Inválidas","Por favor confira seu email e senha.");
      }
      })
      .catch((error) => console.log(error));      

      // if(username == 'user' && password =='password'){
      //   try{
      //     userToken = 'hahagshshe';
      //     await AsyncStorage.setItem('userToken', userToken);
      //   } catch (e) {
      //     // saving error
      //     console.log(e);
      //   }
      // }
      /* if(userToken != null){
        try{
          await AsyncStorage.setItem('userToken', userToken);
        } catch (e) {
          // saving error
          console.log(e);
        }
      }
      dispatch({ type: 'LOGIN', id: username, token: userToken }); */

    },
    signOut: async() => {
      //setUserToken(null);
      //setIsLoading(false);
      try{
          await AsyncStorage.removeItem('userToken');
        } catch (e) {
          // saving error
          console.log(e);
      }
      dispatch({ type: 'LOGOUT'});
    },
    signUp: () => {
      //setUserToken('ahehe');
      //setIsLoading(false);
    }
  }));

  useEffect(() => {
    setTimeout(async() => {
      let userToken;
      userToken = null;
      try{
          userToken = await AsyncStorage.setItem('userToken', userToken);
        } catch (e) {
          // saving error
          console.log(e);
      }
      dispatch({ type: 'RETRIEVE_TOKEN', token: userToken});
    }, 1000);
  }, []);

  if( loginState.isLoading ){
      return(
        <View style={{flex:1,justifyContent:'center',alignItems:'center'}}>
          <ActivityIndicator size="large" color={colors.primaryColor}/>
        </View>
      );
    } 

  return ( 
    <AuthContext.Provider value={authContext}>
      <NavigationContainer>
        { loginState.userToken !== null ? (          
          <Stack.Navigator>
            <Stack.Screen
              component={HomeScreen}
              name="Home"
              options={{
                title: 'Home',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerShown: false
              }}
            />
            <Stack.Screen
              component={DishScreen}
              name="Dish"
              options={{
                title: 'Dish',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
            <Stack.Screen
              component={DishCommentScreen}
              name="DishComments"
              options={{
                title: 'Comentários',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
            <Stack.Screen
              component={ProductScreen}
              name="Product"
              options={{
                title: 'Produto',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                }                
              }}
            />
            <Stack.Screen
              component={ProductReportScreen}
              name="ProductReport"
              options={{
                title: 'Reportar Produto',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
            <Stack.Screen
              component={CompanyScreen}
              name="Company"
              options={{
                title: 'Empresa',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                }                
              }}
            />
            <Stack.Screen
              component={CompanyReportScreen}
              name="CompanyReport"
              options={{
                title: 'Reportar Empresa',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
            <Stack.Screen
              component={RestaurantScreen}
              name="Restaurant"
              options={{
                title: 'Restaurante',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
            <Stack.Screen
              component={RestaurantReportScreen}
              name="RestaurantReport"
              options={{
                title: 'Reportar Restaurante',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
            <Stack.Screen
              component={ProductAddScreen}
              name="ProductAdd"
              options={{
                title: 'Cadastrar Produto',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
            <Stack.Screen
              component={DishAddScreen}
              name="DishAdd"
              options={{
                title: 'Cadastrar Prato',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerTitleContainerStyle: {
                  left: 0, // THIS RIGHT HERE
                },
              }}
            />
          </Stack.Navigator>
          ) 
          :
          <LogInStack.Navigator>
            <LogInStack.Screen
              component={LoginScreen}
              name="LogIn"
              options={{
                title: 'LogIn',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerShown: false
              }}
            />
            <LogInStack.Screen
              component={SignInScreen}
              name="SignIn"
              options={{
                title: 'SignIn',            
                headerTintColor: colors.primaryColor,
                headerTitleStyle: { alignSelf: 'center' },
                headerShown: false
              }}
            />
          </LogInStack.Navigator>
        }
      </NavigationContainer>
    </AuthContext.Provider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
