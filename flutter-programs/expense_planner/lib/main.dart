import 'package:flutter/material.dart';

import 'transaction.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  final List<Transaction> transactionsList = [
    Transaction(id: "t1", title: "Shoes", amount: 108.6, date: DateTime.now()),
    Transaction(id: "t2", title: "milk", amount: 30, date: DateTime.now()),
    Transaction(id: "t3", title: "Console", amount: 10000 , date: DateTime.now()),
    Transaction(id: "t4", title: "PC", amount: 50000, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Budget Planner"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.red,
                child: Text("Chart"),
                elevation: 5,
              ),
            ),
           Column(
             children: [
               Card(child: Text(transactionsList[0].title),),
               Card(child: Text(transactionsList[1].title),),
               Card(child: Text(transactionsList[2].title),),
               Card(child: Text(transactionsList[3].title),)
             ],
           ),
          ],
        ));
  }
}
