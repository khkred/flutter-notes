import 'package:car_firebase/screens/dynamic_user_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final User user;
  final FirebaseAuth auth;


  HomeScreen({required this.auth, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          signOutUser();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DynamicUserValidation()));
        }, icon: const Icon(Icons.exit_to_app))],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            Text("${widget.user.email} is signed in",style: TextStyle(color: Colors.grey, ),),
            Text("${widget.user.phoneNumber}", style: TextStyle(color: Colors.grey, ),),

            //TODO: Add a button with label "list of pets"
          ],
        ),
      ),
    );
  }

  signOutUser() async{

    await widget.auth.signOut().then((value) {
      //First show a snackbar that says the user is signed out
      const snackBar = SnackBar(
          content: Text("User has been signed out"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    });

  }
}