import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'pokemon_network.dart';
import 'model/pokemon.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Pokemon>> pokemonList;

  Future<List<Pokemon>> getPokemon() async {
    var response = await Download().getResponseFromApi();
    var responseJsonObject = jsonDecode(response).cast<Map<String,dynamic>>();

    List<Pokemon> powerList = [];
    for (var jsonPokemon in responseJsonObject) {
      powerList.add(Pokemon.fromJson(jsonPokemon));
    }

    return powerList;
  }

  @override
  Widget build(BuildContext context) {
    pokemonList = getPokemon();

    return Scaffold(
      body: Center(
          child: FutureBuilder<List<Pokemon>>(
              future: pokemonList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: snapshot.data!
                        .map((pokemon) => Row(
                              children: [Text(pokemon.name), Text(pokemon.power)],
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              })),
    );
  }
}
