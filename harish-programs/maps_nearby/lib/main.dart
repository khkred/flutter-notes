import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late GoogleMapController mapController;

 static const String MAPS_API_KEY = "AIzaSyCFU_wVs-2KKFaC6qKKkm5XWbSqqa0_fc8";

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getNearbyPlaces(LatLng(lat,lng));
  }

  void getNearbyPlaces(LatLng center) async {
    final location = Location(lat, lng);
    final result = await _places.searchNearbyWithRadius(location, 2500);

    setState(() {
      if (result.status == "OK") {
        this.places = result.results;

      }
      print(result.status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
