import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_resources.dart';

class Constants{

  static final String API_KEY = "706282fcffb04b8f5588715bb213606d";


   static commonAppbar(String title){
    return AppBar(leading: const Padding(
      padding:  EdgeInsets.only(left: 8.0),
      child: Icon(Icons.arrow_back_ios),
    ),
      centerTitle: true,
      leadingWidth: 50,
      backgroundColor: ColorResources.appBackgroundColor,
      title: Text(title),
    );

  }

}