import React from 'react';
import jsonServer from './jsonServer';


  async function getDishes() {
    /* try {
      console.log('pegando pratos');
      return await jsonServer.get('dishes'), {
      headers: { 
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Authorization", 
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS, PUT, PATCH, DELETE" ,
          "Accept": "application/json" 
      },
    responseType: 'json',
     };
      }catch(error){
        console.log(error);
      } */
      return await jsonServer.get('dishes')
        .then(function (response) {
          console.log(response.data);
        }).catch(error => {
          console.log(error)
        });
  };


export default {
  getDishes  
};
