import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _email = "";
  String _password = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signupUser(String email, String password) async{
    var credentials = (await _auth.createUserWithEmailAndPassword(email: email, password: password));

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
                signupUser(_email, _password);

              });
            }
          }, child: Text("Sign Up"))
        ],
      ),
    );
  }

}
