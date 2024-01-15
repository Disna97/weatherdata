import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherdata/resources/color_resources.dart';
import 'package:weatherdata/resources/constants.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Constants.commonAppbar("Location Selection Screen"),
      body: textFormFeild(),

    );
  }
  textFormFeild(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text Form Field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter your Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0), // Add some spacing

            // Elevated Button
            ElevatedButton(
              onPressed: () {
                // Add functionality for the button click
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                textStyle: TextStyle(fontSize: 18.0),
                primary: ColorResources.appBackgroundLightColor, // Button color
                onPrimary: ColorResources.appBackgroundColor, // Text color
              ),
            ),
          ],
        ),
      ),
    );


  }
}
