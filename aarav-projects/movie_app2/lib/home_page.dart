import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app2/movie_details.dart';
import 'model/movie.dart';
import 'movie_network.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> movieList;

  int i = 0;

  List<String> movieUrl = [
    "https://api.themoviedb.org/3/movie/popular?",
    "https://api.themoviedb.org/3/trending/movie/week?",
  ];

  Future<List<Movie>> getMovie() async {
    var response = await Download(movieUrl[i]).getResponseFromApi();
    var responseJsonObject = jsonDecode(response);
    var results = responseJsonObject["results"];

    return results.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    movieList = getMovie();

    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: 0,
                        child: Text(
                          "Popular",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                    const PopupMenuItem(
                        value: 1,
                        child: Text(
                          "Trending",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
              onSelected: (int index) {
                setState(() {
                  i = index;
                });
              }),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        color: const Color(0xFFfbfcff),
        child: FutureBuilder<List<Movie>>(
            future: movieList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),

                  itemCount: snapshot.data!.length,

                  itemBuilder: (context, index) {
                    var movie = snapshot.data![index];
                    return InkWell(
                      onTap: (){
                        Get.to(MovieDetails(backdropUrl: movie.getImageUrl(movie.backdropPath), movieTitle: movie.name, movieOverView: movie.overview, rating: movie.voteAverage));
                      },
                        child: MovieCard(movie: movie));
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            offset: Offset(0,0)
          )
        ],
        image: DecorationImage(
          image: NetworkImage(movie.getImageUrl(movie.posterPath)),
          fit: BoxFit.fill
        )
      ),

    );
  }
}
