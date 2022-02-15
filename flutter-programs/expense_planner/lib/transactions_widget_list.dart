import 'package:expense_planner/transactionUI.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transactionUI.dart';

class TransactionsWidgetList extends StatelessWidget {

  final List<Transaction> transactionsList;

  TransactionsWidgetList(this.transactionsList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactionsList
          .map((txn) => Card(
        child: TransactionUI(txn),
      ))
          .toList(),
    );
  }
}
