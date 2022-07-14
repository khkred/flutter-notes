import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectedImage extends StatelessWidget {
  XFile image;

  SelectedImage(this.image);

  Future<void> downloadImage() async {
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Image.file(File(image!.path))
        ],
      )
    );
  }
}
