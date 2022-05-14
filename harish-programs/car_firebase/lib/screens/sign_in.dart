import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignIn extends StatefulWidget {

  String email;

  SignIn(this.email);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String _password = "";

  final passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    super.dispose();
  }


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

      /**
       * Checking fetchSignInMethodsForEmail
       */

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

          ListTile(
            title: Text(widget.email),
          ),

          TextFormField(
            decoration: InputDecoration(hintText: "Password"),
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            controller: passwordController,
          ),

          ElevatedButton(onPressed: (){

            setState(() {
              _password = passwordController.text;
            });
            if(widget.email.isEmpty || _password.isEmpty) {
              const snackBar = SnackBar(
                content: Text("One of these fields is empty"),
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar);
            }
            else {
              setState(() {
                signInUser(widget.email, _password);
              });
            }
          }, child: Text("Sign In"))
        ],
      ),
    );
  }

}
