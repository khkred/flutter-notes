import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  String bodyText;

  BodyWidget({required this.bodyText});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text(
        bodyText,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
