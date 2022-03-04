import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

void modalButton(context){
  var modal = "";
  showModalBottomSheet(
    context: context,
    builder: (_){
      return Column(
        children:[
          TextField(),
          FloatingActionButton(onPressed: modal = TextField.)
        ] ,
      );
    }

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    
  }
}
