import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyleResources{
  static TextStyle titleTextStyle(BuildContext context) {
    //18
    double size =18;
    return new TextStyle(

      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize:  size);
  }
  static TextStyle itemTextStyle(BuildContext context) {
    //18
    double size =16;
    return new TextStyle(

      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize:  size);
  }
}