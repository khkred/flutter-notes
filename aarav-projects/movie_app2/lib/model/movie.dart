
import 'package:flutter/src/widgets/basic.dart';

class Movie {
  String name;
  String overview;
  String poster;

  Movie({required this.name, required this.overview,required this.poster});

  factory Movie.fromJson(Map<String, dynamic> movie_json) =>
      Movie(name: movie_json["title"], overview: movie_json["overview"],poster: movie_json["poster_path"]);

  String posterUrl(){
    String image = "https://image.tmdb.org/t/p/w500" + poster;

    return image;
  }
}

