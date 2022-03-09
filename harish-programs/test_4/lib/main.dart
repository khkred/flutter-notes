import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  var fileController = TextEditingController();
  var tilesController = TextEditingController();
  var itemList;
  var fileList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test 4"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                labelText: "Enter a word"
            ),
            controller: fileController,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Tiles"
            ),
            controller: tilesController,
          ),
          ElevatedButton(onPressed: () {
            itemList = List<String>.generate(
                int.parse(tilesController.text), (index) => '${fileController.text},${index + 1}');
            print(itemList);
          }, child: Text("Generate List Tiles")),
          ListView(
            children: itemList.map((item) => ListTile(title: Text(fileController.text))).toList(),
          )
    ],
      ),
    );
  }
}
