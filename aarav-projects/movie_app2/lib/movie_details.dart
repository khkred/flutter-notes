import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  String backdropUrl;
  String movieTitle;
  String movieOverView;
  num rating;

  MovieDetails({
    required this.backdropUrl,
    required this.movieTitle,
    required this.movieOverView,
    required this.rating,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back drop Image
              Image.network(
                  backdropUrl),
              const SizedBox(
                height: 30,
              ),

              //Title Row
              Row(
                children: [
                  const Text(
                    'Title:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    movieTitle,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Overview:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              //Overview Text
              Text( movieOverView,),
                const SizedBox(height: 20,),
            Row(
              children: [
               const Text('Rating:',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),

                Text(rating.toString(),style: const TextStyle(
                  fontSize: 16
                ),)

              ],
            ),],
          ),
        ),
      ),
    );
  }
}
