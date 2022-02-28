import 'package:flutter/material.dart';

class LVBuilder extends StatelessWidget {

  final List<String> dogList;

  LVBuilder(this.dogList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dogList.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(dogList[index]),
          );
        });
  }
}