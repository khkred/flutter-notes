import 'package:http/http.dart' as http;

class Movie{
  String name;
  String overview;

  Movie({required this.name, required this.overview});

  factory Movie.fromJson(Map<String,dynamic> movie_json) => Movie(name: movie_json["title"], overview: movie_json["overview"]);

}