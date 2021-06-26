import React, { Component } from 'react';
import { StyleSheet, View, Text, FlatList, TouchableOpacity, Image } from 'react-native';
import { Ionicons } from '@expo/vector-icons';


class DishCard extends Component { 
  onPress = () => {
      this.props.navigation.navigate('Dish', { dishId: this.props.info.item.id })
  }

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity style={styles.userRow} onPress={this.onPress}>
          <Image
            style={styles.avatar}
            source={{uri: this.props.info.item.userImg}}
          />
          <View>
            <Text style={styles.userText}>{this.props.info.item.user}</Text>
            <Text style={styles.localText}>{this.props.info.item.restaurant}</Text>
          </View>
        </TouchableOpacity>
        <TouchableOpacity onPress={this.onPress}>
          <Image
            style={styles.image}
            source={{uri: this.props.info.item.image}}
          />
          <Text style={styles.description}>{this.props.info.item.description}</Text>
          <View style={styles.infoRow}>
            <Ionicons name="star" size={20} color="#ffd478"/>
            <Text style={styles.infoText}>{this.props.info.item.rating}</Text>
            <Text style={styles.infoText2}>{this.props.info.item.nComments} Comentários</Text>
          </View>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    marginTop: 20,
    width: '100%',
    marginBottom: 10
  },
  avatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
    marginRight: 10
  },
  userRow: {
    marginLeft: 10,
    marginBottom:10,
    alignItems: 'center',
    flexDirection:'row',
    flexWrap: 'wrap'
  },
  userText: {
    fontSize: 15,
    fontWeight: 'bold'
  },
  localText: {
    fontSize: 15,
    color: '#9c9c9c',
  },
  image: {
    width: '100%',
    height: 230
  },
  description: {
    marginTop: 15,
    marginLeft: 15,
    fontSize: 14
  },
  infoRow: {
    marginTop: 10,
    marginLeft: 15,
    flexDirection:'row',
    flexWrap: 'wrap',
    alignItems: 'center',
  },
  infoText:{
    fontSize: 12,
    marginLeft: 5,       
  },
  infoText2:{
    fontSize: 12,
    marginLeft: 10    
  } 
});


export default DishCard;