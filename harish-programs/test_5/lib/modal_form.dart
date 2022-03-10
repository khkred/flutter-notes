import 'package:flutter/material.dart';

class ModalForm extends StatefulWidget {

  Function getListFromModalSheet;

  ModalForm(this.getListFromModalSheet);
  @override
  State<ModalForm> createState() => ModalFormState();
}

class ModalFormState extends State<ModalForm> {
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
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  itemList = List<String>.generate(
                      int.parse(tilesController.text),
                          (index) => '${fileController.text} ${index + 1}');

                  widget.getListFromModalSheet(itemList);
                });
              },
              child: Text("Generate List Tiles")),
        ],
      ),
    );
  }
}

