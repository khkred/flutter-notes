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

  signupUser(String email, String password) async{
    var credentials = (await _auth.createUserWithEmailAndPassword(email: email, password: password));



  }



  @override
  Widget build(BuildContext context) {
    return Column(
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
        }, child: Text("Sign In"))
      ],
    );
  }

}
