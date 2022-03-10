import 'package:flutter/material.dart';
import 'modal_form.dart';
import 'our_list.dart';

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
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: ModalForm(getListFromModalSheet),
            onTap: () {},
          );
        });
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
        title: Text("Test 5"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                modalSheet(context);
              },
              child: Text("Test 5")),
          OurList(itemList: itemList)
        ],
      ),
    );
  }
}
