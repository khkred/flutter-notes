import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PV2 extends StatefulWidget {
  final FirebaseAuth auth;

  const PV2({Key? key, required this.auth}) : super(key: key);

  @override
  State<PV2> createState() => _PV2State();
}

class _PV2State extends State<PV2> {
  String globalVerificationId = "";

  bool otpNotSent = true;
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(32),
          child: otpNotSent
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Phone Number"),
                      controller: _phoneController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_phoneController.text.isEmpty) {
                            const snackBar =
                                SnackBar(content: Text("Phone No is empty"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            verifyPhoneNo(_phoneController.text);
                          }
                        },
                        child: const Text("Get OTP"))
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Enter OTP"),
                      controller: _otpController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_otpController.text.isEmpty) {
                            const snackBar = SnackBar(
                                content: Text("Empty OTP cannot be sent"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            validateOTP(_otpController.text);
                          }
                        },
                        child: const Text("Submit OTP"))
                  ],
                )),
    );
  }

  verifyPhoneNo(String phoneNo) async {

    await widget.auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async{

          //After the User SignsIn
          await widget.auth.signInWithCredential(credential).then((value) {

            const snackBar = SnackBar(
                content: Text("User Signed In SuccessFully"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          });


        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            const snackBar = SnackBar(
                content: Text('The provided phone number is not valid.'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        codeSent: (String verificationId, int? resendToken) async{
          setState(() {
            otpNotSent = false;
            globalVerificationId = verificationId;
          });


        },
        codeAutoRetrievalTimeout: (String verificationId) {

        });
  }

  validateOTP(String otp) async{
    //Validate the OTP by calling a function in Auth

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: globalVerificationId, smsCode: otp);

    await widget.auth.signInWithCredential(credential).then((value){
      const snackBar = SnackBar(
          content: Text('OTP is valid'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}
