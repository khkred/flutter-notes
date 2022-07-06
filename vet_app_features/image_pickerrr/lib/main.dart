
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  XFile? image;
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              ///Pick the image here

              image = await imagePicker.pickImage(source: ImageSource.gallery);

            }, child: const Text('Pick an Image')),
            Container(
              child: image==null? Container(
                width: 200,
                height: 200,
                color: Colors.redAccent.shade400,
              ):SizedBox(
                width: 200,
                height: 200,
                child: Image.file(File(image!.path),
                )
              )
            ),
          ],
        ),
      )
    );
  }
}
