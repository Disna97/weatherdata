import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_resources.dart';

class Constants{

  static final String API_KEY = "706282fcffb04b8f5588715bb213606d";


   static commonAppbar(BuildContext context,String title){
    return AppBar(leading:  Padding(
      padding:  EdgeInsets.only(left: 8.0),
      child: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed:(){
        Navigator.pop(context);
      }),
    ),
      centerTitle: true,
      leadingWidth: 50,
      backgroundColor: ColorResources.appBackgroundColor,
      title: Text(title),
    );

  }

}