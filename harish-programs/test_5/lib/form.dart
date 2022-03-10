import 'package:flutter/material.dart';

class Form extends StatefulWidget {
  @override
  State<Form> createState() => FormState();
}

class FormState extends State<Form> {
  var fileController = TextEditingController();

  var tilesController = TextEditingController();

  var itemList = ["p1", "p2", "p3", "p4", "p5"];

  var fileList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test 5"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Enter a word"),
            controller: fileController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Tiles"),
            controller: tilesController,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  itemList = List<String>.generate(
                      int.parse(tilesController.text),
                          (index) => '${fileController.text},${index + 1}');
                  print(itemList);
                });
              },
              child: Text("Generate List Tiles")),
          Container(
            height: 155,
            child: ListView(
              children: itemList
                  .map((item) => ListTile(title: Text(item)))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}