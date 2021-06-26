import React, { Component } from 'react';
import {View, Text, ScrollView, LogBox} from 'react-native';
import { Header } from 'react-native-elements';
import { Ionicons } from '@expo/vector-icons';
//import Icon from 'react-native-vector-icons/MaterialIcons';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import colors from '../styles/colors';
import DishList from '../components/DishList';
import SearchScreen from './SearchScreen';
import CameraScreen from './CameraScreen';
import LocationScreen from './LocationScreen';
import ProfileScreen from './ProfileScreen';

const Tab = createBottomTabNavigator();


function HomeScreenBase({ navigation}) {
  return (
    <View style={{ flex: 1}}> 
      <Header
        placement="center"
        centerComponent={{ text: 'Home', style: { color: colors.primaryColor, fontWeight: 'bold', fontSize: 20 } }}
          containerStyle={{
            backgroundColor: '#fff',
            justifyContent: 'space-around',
            elevated: true,
            elevation: 4,
            height: "14%"
          }}
      />    
      <ScrollView>
        <DishList navigation= {navigation} />
      </ScrollView>
    </View>
  );
}

class HomeScreen extends Component {
  render() {
    //FlatList need be into a scrollview, then i disable this warning
    LogBox.ignoreLogs(['VirtualizedLists should never be nested']);   
    return (      
      <Tab.Navigator
        screenOptions={({ route }) => ({
          tabBarIcon: ({ focused, color, size }) => {
            let iconName;

            if (route.name === 'Home') {
              iconName = 'home-outline';
            } else if (route.name === 'Search') {
              iconName = 'search-outline';
            }else if (route.name === 'Camera') {
              iconName = 'camera-outline';
            }else if (route.name === 'Location') {
              iconName = 'location-outline';
            }else if (route.name === 'Profile') {
              iconName = 'person-outline';
            }

            // You can return any component that you like here!
            return <Ionicons name={iconName} size={size} color={color} />;
          },
        })}
        tabBarOptions={{
          showLabel: false,
          activeTintColor: colors.primaryColor,
          inactiveTintColor: 'gray',
        }}
      >
        <Tab.Screen name="Home" component={HomeScreenBase} />
        <Tab.Screen name="Search" component={SearchScreen} />
        <Tab.Screen name="Camera" component={CameraScreen} />
        <Tab.Screen name="Location" component={LocationScreen} />
        <Tab.Screen name="Profile" component={ProfileScreen} />
      </Tab.Navigator>
  );
  }
}

export default HomeScreen;