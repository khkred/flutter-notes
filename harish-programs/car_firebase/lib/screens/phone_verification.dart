import 'package:car_firebase/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneVerification extends StatefulWidget {

  FirebaseAuth auth;
  PhoneVerification(this.auth);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  validatePhoneNumber(String phoneNumber) async {

    await widget.auth.verifyPhoneNumber(
        phoneNumber: '+65 86484986',
        verificationCompleted: (PhoneAuthCredential credential) async{
          // I want to link the users phone number
          await widget.auth.signInWithCredential(credential);

          var user = widget.auth.currentUser;

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(user: user!,)),
          );

        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            const snackBar = SnackBar(
                content: Text('The provided phone number is not valid.'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             const  Text(
                "Login",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
            const   SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey.shade200)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Phone Number"),
                controller: _phoneController,
              ),
              SizedBox(
                height: 16,
              ),

              //TODO: Look at OTP in iOS
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey.shade200)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Password"),
                controller: _passController,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.all(16),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text("Login"),
                //padding: EdgeInsets.all(16),
                onPressed: () {
                  //code for sign in
                  String phoneNumber  = _phoneController.text;

                  if(phoneNumber.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text("Phone Number is empty"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else {
                    setState(() {
                      validatePhoneNumber(phoneNumber);
                    });
                  }
                },
                // color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
