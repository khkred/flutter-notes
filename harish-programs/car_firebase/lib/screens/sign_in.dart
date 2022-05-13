import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String _email = "";
  String _password = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;


  signInUser(String email, String password) async{
    User? user;

    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    var bar = SnackBar(content: Text("${user?.email} is signed in"));
    ScaffoldMessenger.of(context).showSnackBar(bar);
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        const snackBar = SnackBar(content: Text("User not found"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      else if (e.code == 'wrong-password'){
        const snackBar2 = SnackBar(content: Text("Incorrect Password"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar2);
      }
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Email"),
            onChanged: (name) {
              setState(() {
                _email = name;
              });
            },
          ),

          TextFormField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            onChanged: (name) {
              setState(() {
                _password = name;
              });
            },
          ),

          ElevatedButton(onPressed: (){
            if(_email.isEmpty || _password.isEmpty) {
              const snackBar = SnackBar(
                content: Text("One of these fields is empty"),
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar);
            }
            else {
              setState(() {
                signInUser(_email, _password);
              });
            }
          }, child: Text("Sign In"))
        ],
      ),
    );
  }

}
