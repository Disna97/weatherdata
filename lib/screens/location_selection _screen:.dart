import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherdata/resources/color_resources.dart';
import 'package:weatherdata/resources/constants.dart';
import 'package:weatherdata/resources/utils.dart';
import 'package:weatherdata/screens/weather_display_screen.dart';

import '../provider/weather_data.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constants.commonAppbar(context,"Location Selection Screen"),
      body: SingleChildScrollView(
        child: textFormFeild(context),
      )
    );
  }

  textFormFeild(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text Form Field
            TextField(
              controller: context
                  .read<LocationSelectionProvider>()
                  .textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter your Location',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                context
                    .read<LocationSelectionProvider>()
                    .submitButton(context, val);
              },
            ),
            SizedBox(height: 16.0),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Consumer<LocationSelectionProvider>(
                  builder: (context, snapshot, _) {
                return ListView.builder(

                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: snapshot.geoLocationApi.length,
                    itemBuilder: (BuildContext c, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[200],
                          child: ListTile(onTap: (){

                            context.read<LocationSelectionProvider>().fetchWeatherData(context, snapshot.geoLocationApi[index]!.lat.toString(),
                                snapshot.geoLocationApi[index]!.lon.toString());

                              Utils.navigateTo(context, WeathwerDisplayScreen(

                              ));

                          },
                            title: Text(snapshot.geoLocationApi[index]!.name
                                .toString()),
                            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Lat  :" +
                                    snapshot.geoLocationApi[index]!.lat
                                        .toString()),
                                Text("Long  :" +
                                    snapshot.geoLocationApi[index]!.lon
                                        .toString())
                              ],
                            ),
                            trailing:
                                Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      );
                    });
              }),
            ), // Add some spacing
          ],
        ),
      ),
    );
  }
}
