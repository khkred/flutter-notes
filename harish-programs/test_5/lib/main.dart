import 'package:flutter/material.dart';
import 'modal_form.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

void modalSheet(context){
  showModalBottomSheet(
    context: context,
    builder: (_){
      return GestureDetector(
        child: ModalForm(),
        onTap: (){},
      );
    }
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test 5"),
      ),
      body: Column(
        children: [ElevatedButton(onPressed: (){}, child: Text("Test 5"))],
      ),
    );
  }
}
