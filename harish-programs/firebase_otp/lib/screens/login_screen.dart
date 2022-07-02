import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum LoginState { showMobileFormState, showOtpFormState }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileNoController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  @override
  void dispose() {
    mobileNoController.dispose();
    otpController.dispose();
    super.dispose();
  }

  LoginState currentState = LoginState.showMobileFormState;

  checkPhoneNo(context) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: mobileNoController.text,
        verificationCompleted: (phoneAuthCredential) async {
          setState(() {
            showLoading = false;
          });
        },
        verificationFailed: (verificationFailed) async {
          SnackBar snackBar =
              SnackBar(content: Text(verificationFailed.message!));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            currentState = LoginState.showOtpFormState;
            this.verificationId = verificationId;
            showLoading = false;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  getMobileFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Mobile No'),
          controller: mobileNoController,
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                showLoading = true;
              });
              checkPhoneNo(context);
            },
            child: Text('Get OTP')),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'OTP'),
          controller: otpController,
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text('Verify OTP')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : currentState == LoginState.showMobileFormState
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
      ),
    );
  }

  signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState((){
        showLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }
}
