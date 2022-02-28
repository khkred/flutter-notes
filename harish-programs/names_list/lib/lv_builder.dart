import 'package:flutter/material.dart';

class LVBuilder extends StatelessWidget {

  final List<String> thousandList;

  LVBuilder(this.thousandList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: thousandList.length,
        itemBuilder: (context,index){
        return ListTile(
          title: Text(thousandList[index]),
        );
        });
  }
}
