import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weatherdata/resources/constants.dart';
import 'package:http/http.dart' as http;

import '../api/apis.dart';
import '../models/display_item_model.dart';
import '../models/geolocationmodel.dart';

class WeatherService{

  static Future<List<GeoLocationApi>?> fetchLocationService(
      String location) async {
  
    try {
      Response response = await http.get(Uri.parse(
          "http://api.openweathermap.org/geo/1.0/direct?q={$location}&limit=5&appid=706282fcffb04b8f5588715bb213606d"));
      //print(response.body);
      if (response.statusCode == 200) {
        List<GeoLocationApi> geo = geoLocationApiFromJson(response.body);
        return geo;
      } else if (response.statusCode == 401) {

      }
    } on Exception catch (e, s) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }
  static Future<DisplayItemModel?> fetDisplayItems(
      String lat,String lon) async {


    try {
      Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=706282fcffb04b8f5588715bb213606d"));
      //print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return DisplayItemModel.fromJson(jsonResponse);
      } else if (response.statusCode == 401) {

      }
    } on Exception catch (e, s) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }
}