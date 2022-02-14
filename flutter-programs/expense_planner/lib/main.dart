import 'package:flutter/material.dart';

import 'transaction.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  List<Transaction> transactionsList = [
    Transaction(id: "t1", title: "Shoes", amount: 108.6, date: DateTime.now()),
    Transaction(id: "t2", title: "milk", amount: 30, date: DateTime.now()),
    Transaction(id: "t3", title: "Console", amount: 10000 , date: DateTime.now()),
    Transaction(id: "id", title: "PC", amount: 50000, date: DateTime.now())
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
            Card(
              color: Colors.amber,
              child: Text("Transaction"),
            ),
          ],
        ));
  }
}
