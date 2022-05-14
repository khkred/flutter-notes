import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {

  //Completed: Add an email parameter and a constructor

  String email;

  SignUp(this.email);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  //TODO: Call the email parameter, remove _email and emailEditingController
  //TODO: Remove TextForm Field for email and replace it with a list tile.


  String _password = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signupUser(String email, String password) async {
    var credentials = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(),
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
          ElevatedButton(
              onPressed: () {
                if (_email.isEmpty || _password.isEmpty) {
                  const snackBar = SnackBar(
                    content: Text("One of these fields is empty"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  setState(() {
                    signupUser(_email, _password);
                  });
                }
              },
              child: Text("Sign Up"))
        ],
      ),
    );
  }
}
