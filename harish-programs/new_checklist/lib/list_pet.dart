import 'package:flutter/material.dart';
import 'package:new_checklist/checkboxes_list.dart';

class ListPet extends StatelessWidget {
  var myMenuItems = <String>["Select Pets"];

  var petList = List<String>.generate(10, (i) {
    return "Pet ${i + 1}";
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Pets"),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return myMenuItems.map((String choice) {
                return PopupMenuItem(child: Text(choice),
                  value: choice,);
              }).toList();
            },
            onSelected: (item){
              switch(item){
                case "Select Pets":
                  print("Select Pets Clicked");
                  break;
              }
            },
          )
        ],
      ),
      body: Column(
        children: petList
            .map((pet) =>
            ListTile(
              title: Text(pet),
            ))
            .toList(),
      ),
    );
  }
}
