import 'package:car_firebase/screens/sign_in.dart';
import 'package:car_firebase/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DynamicUserValidation extends StatefulWidget {
  const DynamicUserValidation({Key? key}) : super(key: key);


  @override
  State<DynamicUserValidation> createState() => _DynamicUserValidationState();
}

class _DynamicUserValidationState extends State<DynamicUserValidation> {

  final myController = TextEditingController();

  String _email = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  validateUser(String email) async{

    var tasks = await _auth.fetchSignInMethodsForEmail(email);

    if(tasks.isEmpty){
      //Completed: Navigate to Signup Screen with the email
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(email)));
      
    }
    else {
      //Completed: Navigate to SignIn Screen with the email
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(email)));

    }




    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }


  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Enter your email"),
              controller: myController,
            ),
          ),
          Expanded(
              flex: 1,child: IconButton(onPressed: () {
                setState(() {
                  _email = myController.text;
                });
                if(_email.isEmpty){
                  const snackBar = SnackBar(
                    content: Text("Email is empty"),
                  );
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar);
                } else {
                  validateUser(_email);
                }

          }, icon: const Icon(Icons.arrow_forward))),
        ],
      ),
    );
  }
}
