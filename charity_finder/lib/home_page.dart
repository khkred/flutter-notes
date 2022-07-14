import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charity_finder/charity_details.dart';
import 'model/charity.dart';
import 'charity_network.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Charity>> charityList;

  int i = 0;

  List<String> movieUrl = [
    "https://api.themoviedb.org/3/movie/popular?",
    "https://api.themoviedb.org/3/trending/movie/week?",
  ];

  Future<List<Charity>> getCharity() async {
    var response = await Download(movieUrl[i]).getResponseFromApi();
    var responseJsonObject = jsonDecode(response);
    var results = responseJsonObject["results"];

    return results.map<Charity>((json) => Charity.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    charityList =   getCharity();

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
        child: FutureBuilder<List<Charity>>(
            future: charityList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),

                  itemCount: snapshot.data!.length,

                  itemBuilder: (context, index) {
                    var charity = snapshot.data![index];
                    return InkWell(
                        onTap: (){
                          Get.to(CharityDetails(charityOverview: '', charityName: '',),);
                        },
                        child: CharityCard(charity: charity));
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

class CharityCard extends StatelessWidget {
  const CharityCard({
    Key? key,
    required this.charity,
  }) : super(key: key);

  final Charity charity;

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
              image: NetworkImage(charity.getImageUrl(charity.logoPath)),
              fit: BoxFit.fill
          )
      ),

    );
  }
}
