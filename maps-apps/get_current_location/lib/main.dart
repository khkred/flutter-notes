import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  /// The following function determines the position
  Future<Position> determinePosition() async {
    //Check if the position is enabled

    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      return Future.error(_kLocationServicesDisabledMessage);
    }

    /**
     * Request Location Permission
     */
    await Geolocator.requestPermission();

    /**
     * Check the permission for location
     */

    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      return Future.error(_kPermissionDeniedMessage);
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error(_kPermissionDeniedForeverMessage);
    }

    return Geolocator.getCurrentPosition();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getVetsLocations(String latitude, String longitude) async{

    String vetsUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=vets&location=$latitude%2C$longitude&radius=2500&type=veterinary_care&key=AIzaSyCFU_wVs-2KKFaC6qKKkm5XWbSqqa0_fc8";

    var vetsJson = await http.get(Uri.parse(vetsUrl));

    print(vetsJson.body);

  }

  Future<String> _getAddressFromLocation() async {
    Position position = await determinePosition();
    List<Placemark> p = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(p);
    Placemark placemark = p[0];
    var address =
        "${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}";

    return address;
  }

  Future<List<double>> getLatLng() async {
    Position position = await determinePosition();
    List<double> latLong = [position.latitude, position.longitude];

    return latLong;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        List<double> latLng = await getLatLng();

        await _getVetsLocations(latLng.first.toString(), latLng[1].toString());

      },
        child: const Text('Vets'),

      ),
        body: Container(
      child: FutureBuilder<List<double>>(
        future: getLatLng(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(snapshot.data![0], snapshot.data![1]),
                    zoom: 11.0));
          }
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
