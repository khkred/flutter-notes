import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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

          height: 300,
          width: 200,
          decoration: BoxDecoration(

              image: DecorationImage(
                image: NetworkImage(imageUrl),

              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
              ),
              border: Border.all(color: Colors.greenAccent,
                  width: 2,
                  style: BorderStyle.solid),

              boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset
              ),
          ],
        ),
      ),
    ),);
  }
}
