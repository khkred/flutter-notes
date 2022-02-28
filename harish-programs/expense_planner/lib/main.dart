import 'package:flutter/material.dart';

import 'transaction.dart';
import 'transactions_widget_list.dart';
import 'expenses_chart.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactionsList = [
    Transaction(id: "t1", title: "Shoes", amount: 108.6, date: DateTime.now()),
    Transaction(id: "t2", title: "milk", amount: 30, date: DateTime.now()),
    Transaction(
        id: "t3", title: "Console", amount: 10000, date: DateTime.now()),
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
            ExpensesChart(),
            Card(
              elevation: 5,
              child: TransactionsWidgetList(transactionsList),
            ),
          ],
        ));
  }
}

