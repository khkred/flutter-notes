
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_pickerrr/firebase_options.dart';
import 'package:image_pickerrr/selectedImage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool noImage = true;
  XFile? image;
  ImagePicker imagePicker = ImagePicker();

  final storageRef = FirebaseStorage.instance.ref();

  Future<void> uploadImageToFirebase() async{
    try{
      final imageRef = storageRef.child(image!.path);
      await imageRef.putFile(File(image!.path));
    } on FirebaseException catch(e){
      SnackBar snackBar = SnackBar(content: Text(e.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

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

              setState((){
                noImage = false;
              });


            }, child: const Text('Pick an Image')),
            Container(
             child: noImage? Container(
                width: 200,
                height: 200,
                color: Colors.redAccent.shade400,
              ):SizedBox(
                width: 200,
                height: 200,
                child: Image.file(File(image!.path),
                ),
              )
            ),

            ElevatedButton(onPressed: () async{
              await uploadImageToFirebase();
            }, child: const Text('Upload Image')),
            FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedImage()));
            })
          ],
        ),
      )
    );
  }
}
