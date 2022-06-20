class Vet{
  double latitude;
  double longitude;
  String name;

  Vet({required this.longitude, required this.latitude, required this.name});

  factory Vet.fromJson(Map<String, dynamic> vetJson) => Vet(
    latitude: vetJson["geometry"]["location"]["lat"],
    longitude: vetJson["geometry"]["location"]["lng"],
    name: vetJson["name"]
  );
}
