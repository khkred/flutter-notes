import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  //generate 10 persons

  var persons = List<String>.generate(1000, (index) => 'person ${index+1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View'),),
      body: ListView.separated(itemBuilder: (context, int index){
        return ListTile(title: Text(persons[index]),);
      }, separatorBuilder: (context,int index){
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(2),
            child: const Text('------------------------'));
      }, itemCount: persons.length)


    );

  }
}
