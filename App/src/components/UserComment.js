import React, { Component } from 'react';
import { StyleSheet, View, Text, Image, ScrollView } from 'react-native';


class UserComment extends Component {   
  render() {
    return (      
      <View style={{marginLeft: this.props.spacement}}>
        <View style={styles.userRow}>
          <Image
            style={styles.avatar}
            source={{uri: this.props.info.item.userImg}}            
          /> 
          <View>
              <Text style={styles.userText}>{this.props.info.item.userName}</Text>
              <View style={styles.container}>
                <Text>{this.props.info.item.content}</Text>
              </View>
            </View>               
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  userRow: {
    marginTop: 15,
    marginBottom:10,
    flexDirection:'row',
    flexWrap: 'wrap',  
    marginTop: 5
  },
  userText: {
    fontSize: 15,
    fontWeight: 'bold'
  },
  avatar: {
    width: 50,
    height: 50,
    borderRadius: 30,
    marginRight: 10
  }, 
  container: {
    maxWidth: '80%',
    flexGrow: 1,
    flex: 1,
  }
});


export default UserComment;
