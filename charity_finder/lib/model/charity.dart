class Charity {
  String name;
  String overview;

  Charity(
      {required this.name,
        required this.overview});

  // Convert the json object to a movie object

  factory Charity.fromJson(Map<String, dynamic> charityJson) => Charity(
      name: charityJson["name"],
      overview: charityJson["id"]);

  String getImageUrl(String path) {

    String image = "https://api.globalgiving.org/api/public/services/search/projects" + path;

    return image;
  }

}
