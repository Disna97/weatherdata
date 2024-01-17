import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{
  static navigateTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}