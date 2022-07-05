import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  var numberController = TextEditingController();


  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  Future<void> _makePhoneCall(String phoneNo) async{
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNo
    );

    await launchUrl(phoneUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: numberController,
            keyboardType: TextInputType.number,
          ),
          IconButton(onPressed: () async{
            String phoneNo = numberController.text;
            await _makePhoneCall(phoneNo);
          }, icon: const Icon(Icons.phone))
        ],
      ),
    );
  }
}
