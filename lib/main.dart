import 'package:flutter/material.dart';
import './homepage.dart';
import './datasource.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme : ThemeData(
      primaryColor: primaryBlack
    ),
    home: HomePage(),
  ));
}