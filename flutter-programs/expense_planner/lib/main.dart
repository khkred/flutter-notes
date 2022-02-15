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
           Card(
             child: Column(
               children: transactionsList.map((txn) => Card(child: Row(
                 children: [
                   //First Child
                   Container(
                     child: Card(
                       child: Text(txn.amount.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),),
                     ),
                     margin: EdgeInsets.symmetric(vertical:10,horizontal: 15),
                     padding: EdgeInsets.all(10),
                   ),
                   // Second child is a column
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(txn.title,style: TextStyle(fontSize: 15),),
                       Text(txn.date.toString(),style: TextStyle(color: Colors.grey,fontSize: 10),)
                     ],
                   )
                 ],
               ),)).toList(),
             ),
           ),
          ],
        ));
  }
}
