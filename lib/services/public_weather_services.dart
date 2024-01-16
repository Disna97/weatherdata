import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weatherdata/resources/constants.dart';
import 'package:http/http.dart' as http;

import '../api/apis.dart';
import '../models/geolocationmodel.dart';

class WeatherService{
  static Future<GeoLocationApi?> fetchRecPaymentService(BuildContext context,
      String location) async {
    try {
      Response response = await http.post(
          Uri.parse(APIUrls.geoCOdingApi(location, Constants.API_KEY)));
          if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        return GeoLocationApi.fromJson(responseJson);
      } else if(response.statusCode == 401) {

      }
    } on Exception catch (e, s) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }
}