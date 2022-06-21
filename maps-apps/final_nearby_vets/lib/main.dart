import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp( home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //A google maps controller
  late GoogleMapController googleMapController;

  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

Future<Position> determinePosition() async {
  ///Check if location is enabled
  bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

  if(!isLocationEnabled) {
    return Future.error(_kLocationServicesDisabledMessage);
  }


  /**
   * Request Location Permission
   */
  await Geolocator.requestPermission();

  ///Check if the kind of permission we got

  LocationPermission locationPermission = await Geolocator.checkPermission();

  if(locationPermission == LocationPermission.denied) {
    return Future.error(_kPermissionDeniedMessage);
  }

  if(locationPermission == LocationPermission.deniedForever) {
    return Future.error(_kPermissionDeniedForeverMessage);
  }

  return Geolocator.getCurrentPosition();
}


  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  Set<Marker> _markers = Set<Marker>();

  Future<List<double>> getLatLng() async {
    Position position = await determinePosition();
    List<double> latLong = [position.latitude, position.longitude];

    return latLong;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<double>>(
        future: getLatLng(),
          builder: (context,snapshot){

          if(snapshot.hasData){
            return GoogleMap(
              onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(snapshot.data![0],snapshot.data![1]),
                  zoom: 11
                ));
          }
          if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          }

          return CircularProgressIndicator();

          }),
    );
  }
}
