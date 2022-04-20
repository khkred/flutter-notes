import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {


  String imageUrl = "https://images.unsplash.com/photo-1647950440643-6dfbeaff0c25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(

          height: 200,
          width: 150,
          decoration:  BoxDecoration(

            image: DecorationImage(
              image: NetworkImage(imageUrl),

            ),
            border: Border.all(color: Colors.greenAccent,
            width: 4,
            style: BorderStyle.solid)

            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 20.0,
            //     spreadRadius: 15,
            //     offset: const Offset(5.0,8.0),
            //     color: Colors.redAccent.withOpacity(0.3)
            //   ),
            // ]
          ),
        ),
      ),
    );
  }
}
