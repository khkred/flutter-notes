import 'package:flutter/material.dart';
import 'modalForm.dart';
import 'ourlist.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> itemList = [];

  void modalSheet(context) {
    showModalBottomSheet(context: context, builder: (_) {
      return GestureDetector(
        child:  ModalForm(getListFromModalSheet),
        onTap: (){},
      );
    }
    );
  }

  void getListFromModalSheet(List<String> newItemList) {

    setState(() {
      itemList = newItemList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test 6"),
        actions: [IconButton(onPressed: (){modalSheet(context);}, icon: Icon(Icons.add))],
      ),
      body: OurList(itemList: itemList),
    );
  }
}
