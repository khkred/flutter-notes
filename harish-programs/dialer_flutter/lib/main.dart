import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextEditingController phoneController = TextEditingController();


  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  _makingPhoneCall(String phoneNo) async {
    final Uri launchUri =   Uri(scheme:'tel',
    path: phoneNo);

    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Phone No',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      onPressed: () async{
                        await _makingPhoneCall(phoneController.text);
                      },
                      icon: const Icon(Icons.phone),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
