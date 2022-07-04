class Movie {
  String name;
  String overview;
  String posterPath;
  String backdropPath;
  String releaseDate;
  num voteAverage;

  Movie(
      {required this.name,
        required this.overview,
        required this.posterPath,
        required this.backdropPath,
        required this.releaseDate,
        required this.voteAverage});

  // Convert the json object to a movie object

  factory Movie.fromJson(Map<String, dynamic> movieJson) => Movie(
      name: movieJson["title"],
      overview: movieJson["overview"],
      posterPath: movieJson["poster_path"],
      backdropPath: movieJson["backdrop_path"],
      releaseDate: movieJson["release_date"],
      voteAverage: movieJson["vote_average"]);

  String getImageUrl(String path) {

    String image = "https://image.tmdb.org/t/p/w500" + path;

    return image;
  }

}
