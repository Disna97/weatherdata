import 'package:flutter/cupertino.dart';
import 'package:weatherdata/models/display_item_model.dart';
import 'package:weatherdata/models/geolocationmodel.dart';

import '../services/public_weather_services.dart';

class LocationSelectionProvider extends ChangeNotifier {
  List<GeoLocationApi?> geoLocationApi = [];
  List<DisplayItemModel?> displayItemModel =[];

  final TextEditingController textEditingController = TextEditingController();


  submitButton(BuildContext context, String location) async {
    WeatherService.fetchLocationService(location).then((value) =>
    {
      geoLocationApi.clear(),
      value!.forEach((element) {
        if (!geoLocationApi.contains(element.name)) {
          geoLocationApi.add(element);

        }
        geoLocationApi.toSet().toList();

        notifyListeners();
      })
    });
  }

  fetchWeatherData(BuildContext context, String lat, String lon) async {
    displayItemModel.clear();
    WeatherService.fetDisplayItems(lat, lon).then((value) => {
      displayItemModel.add(value),
      print("ffffff"+displayItemModel.first!.name.toString())





    }).then((value){
      notifyListeners();
    });
  }
}