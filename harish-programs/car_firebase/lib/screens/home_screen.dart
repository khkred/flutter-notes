import 'package:car_firebase/screens/dynamic_user_validation.dart';
import 'package:car_firebase/screens/list_pet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {

  final User user;
  final FirebaseAuth auth;


  HomeScreen({required this.auth, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  Future<bool?> _onBackPressed(BuildContext context) {

    // show Dialog will return the boolean value

    return showDialog<bool>(context: context, builder: (context)=>AlertDialog(
      content: const Text("Are you sure?"),
      title: const Text("Do you want to exit"),

      actions: [
        ElevatedButton(onPressed: ()=>Navigator.pop(context,false), child: const Text("No")),
        /**
         * When yes is pressed we have to sign out the user
         */
        ElevatedButton(onPressed: () async{
          await signOutUser();
   return Navigator.pop(context,true);
    }, child
    : const Text("Yes"))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        print("Back pressed");
        var result = await _onBackPressed(context);

        return result ?? false;
      },
      child: Scaffold(
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
            const  Text("You are Logged in successfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            const   SizedBox(height: 16,),
              Text("${widget.user.email} is signed in",style: const TextStyle(color: Colors.grey, ),),
              Text("${widget.user.phoneNumber}", style: const TextStyle(color: Colors.grey, ),),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListPets()));
              }, child: const Text("List of Pets"))

            ],
          ),
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