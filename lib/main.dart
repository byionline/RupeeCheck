import 'package:RupeeCheck/HomePage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    // Remove DebugCheck Banner
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: HomePage(),
  ));
}