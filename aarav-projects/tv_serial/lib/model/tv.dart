
import 'package:flutter/src/widgets/basic.dart';

class Tv {
  String name;
  String overview;
  String poster;

  Tv({required this.name, required this.overview,required this.poster});

  factory Tv.fromJson(Map<String, dynamic> tv_json) =>
      Tv(name: tv_json["name"], overview: tv_json["overview"],poster: tv_json["poster_path"]);

  String posterUrl(){
    String image = "https://image.tmdb.org/t/p/w500" + poster;

    return image;
  }
}

