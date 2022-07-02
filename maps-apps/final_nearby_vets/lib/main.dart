import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:final_nearby_vets/utils/constants.dart';
import 'models/total_data.dart';
import 'models/vet_clinic.dart';

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

  /**
   * We get the total data in the following Function
   */

  Future<TotalData> getTotalData() async {


    List<double> latLng = await getLatLng();

    String vetsUrl =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=vets&location=${latLng[0]}%2C${latLng[1]}&radius=2500&type=veterinary_care&key=${Constants.apiKey}";


    ///Getting the data
    final response = await http.get(Uri.parse(vetsUrl));

    final Map<String,dynamic> data = jsonDecode(response.body);


    print(data);



    List<VetClinic> vetClinics = (data["results"] as List).map((vetJson) => VetClinic.fromJson(vetJson)).toList();

    /**
     * Adding the markets
     */

    for(VetClinic vetClinic in vetClinics){
      final marker = Marker(markerId: MarkerId(vetClinic.placeId),
      position: LatLng(vetClinic.lat,vetClinic.lng),
        infoWindow: InfoWindow(
          title: vetClinic.name,
          snippet: vetClinic.address,
        ),
      );
      _markers.add(marker);
    }

    return TotalData(usersLat: latLng[0], usersLng: latLng[1], vetClinics: vetClinics);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TotalData>(
        future: getTotalData(),
          builder: (context,snapshot){

          if(snapshot.hasData){
            print(snapshot.data);
            return Container(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(snapshot.data!.usersLat,snapshot.data!.usersLng),
                    zoom: 11.0,
                  ),
              markers: _markers,
              ),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          }

          return CircularProgressIndicator();

          }),
    );
  }
}
