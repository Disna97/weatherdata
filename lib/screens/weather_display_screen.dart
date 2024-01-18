import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherdata/models/display_item_model.dart';
import 'package:weatherdata/provider/weather_data.dart';
import 'package:weatherdata/resources/style_resources.dart';

import '../resources/constants.dart';

class WeathwerDisplayScreen extends StatefulWidget {


   WeathwerDisplayScreen({super.key,});

  @override
  State<WeathwerDisplayScreen> createState() => _WeathwerDisplayScreenState();
}

class _WeathwerDisplayScreenState extends State<WeathwerDisplayScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Constants.commonAppbar(context, "Weather Display Screen"),
      body:Consumer<LocationSelectionProvider>(
          builder: (context, snapshot, _) {
            return snapshot.displayItemModel.isNotEmpty?Container(
              child: ListTile(title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  sizedWideget(),
                  itemWidget("City Name",snapshot.displayItemModel.first!.name.toString()),
                  sizedWideget(),
                  itemWidget("Current Temperature",snapshot.displayItemModel.first!.main!.temp.toString()),
                  sizedWideget(),
                  itemWidget("Weather Condition",snapshot.displayItemModel.first!.weather!.first.icon.toString()),
                  sizedWideget(),
                  itemWidget("Min Temperature",snapshot.displayItemModel.first!.main!.tempMin.toString()),
                  sizedWideget(),
                  itemWidget("Max Temperature",snapshot.displayItemModel.first!.main!.tempMax.toString()),
                  sizedWideget(),
                  itemWidget("Wind Speed",snapshot.displayItemModel.first!.wind!.speed.toString()),
                  sizedWideget(),
                  itemWidget("Humidity",snapshot.displayItemModel.first!.main!.humidity.toString()),



                ],
              ),),
            ):Container();
          })

    );
  }
  sizedWideget(){
    return  SizedBox(height: 15,);
  }
  itemWidget(String name,String element){
    return  Row(
      children: [
        Expanded(flex: 2,
            child: Text(name,style: StyleResources.titleTextStyle(context),)),
        Expanded(flex: 1,
            child: Text(":")),
        Expanded(flex: 2,
            child:  Text(element,style: StyleResources.itemTextStyle(context)))
      ],
    );
  }

}