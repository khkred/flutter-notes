import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_demo/add_user.dart';
import 'package:firestore_demo/list_users.dart';
import 'package:firestore_demo/realtime_users.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {




  String fullName = "";
   String company ="";
   int age = 0;


   String documentId = "";
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                fullName = "Sebastian Thrun";
                company = "Red Notice Inc";
                age = 23;

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AddUser(fullName, company, age)),
                );

              }, child: Text("Add Data 1")),
              TextButton(onPressed: (){

                fullName = "Michelle Holler";
                company = "Holler Ammunition";
                age = 45;

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AddUser(fullName, company, age)),
                );

              }, child: Text("Add Data 2")),
              TextButton(onPressed: (){

                fullName = "Luka Doncic";
                company = "Slavic Basketball LLP";
                age = 38;

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AddUser(fullName, company, age)),
                );
              }, child: Text("Add Data 3")),
            ],
          ),
          const SizedBox(height: 30,),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const RealTimeUsers()),
            );

          }, child: Text("Real Time Update"))
        ],
      ),
    );
  }
}
