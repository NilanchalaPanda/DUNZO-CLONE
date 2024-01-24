import 'package:flutter/material.dart';

class AppWidget{

  static TextStyle boldTextFieldStyle(){
    // ignore: prefer_const_constructors
    return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins');
  }

  static TextStyle headerTextFieldStyle(){
    // ignore: prefer_const_constructors
    return TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins');
  }

  static TextStyle lightTextFieldStyle(){
    // ignore: prefer_const_constructors
    return TextStyle(
      color: Colors.black38,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins');
  }
}