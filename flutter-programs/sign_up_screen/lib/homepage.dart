import 'package:flutter/material.dart';
import 'credentials.dart';

class HomePage extends StatelessWidget {
  Credentials credentials;

  HomePage(this.credentials);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(credentials.username),
              Text(credentials.password),
            ],
          ),

      ),
    );
  }
}
