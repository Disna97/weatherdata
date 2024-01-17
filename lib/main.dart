import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherdata/provider/weather_data.dart';
import 'package:weatherdata/screens/location_selection%20_screen:.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationSelectionProvider()),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:LocationSelectionScreen()
      ),
    );
  }
}


