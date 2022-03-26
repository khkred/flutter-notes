import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'apiUser.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 fetchUser() async{

    //This line will get the Json Object from our URL
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    //if the response is successful let's convert the response to a json object

    if(response.statusCode == 200)
      {
        var jsonObject = jsonDecode(response.body);

        print(jsonObject);

        // Get userId from jsonObject

        int userId = jsonObject['userID'];
        String title = jsonObject['title'];

        var apiUser = ApiUser(userId, title);


      }
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data from Internet'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Download Data'),
          onPressed: fetchUser,
        ),
      ),
    );
  }
}
