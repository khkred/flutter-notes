import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionUI extends StatelessWidget {
  final Transaction txn;

  TransactionUI(this.txn);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //First Child
        Container(
          decoration: BoxDecoration(
              border: Border.all()
          ),
          child: Text(
            txn.amount.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple),
          ),
          margin: EdgeInsets.symmetric(
              vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
        ),
        // Second child is a column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txn.title,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              txn.date.toString(),
              style: TextStyle(
                  color: Colors.grey, fontSize: 10),
            )
          ],
        )
      ],
    );
  }
}
