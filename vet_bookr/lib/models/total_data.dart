import 'package:vet_bookr/models/vet_clinic.dart';

class TotalData{

  double usersLat;
  double usersLng;

  List<VetClinic> vetClinics;

  TotalData({
    required this.usersLat,
    required this.usersLng,
    required this.vetClinics
  });
}