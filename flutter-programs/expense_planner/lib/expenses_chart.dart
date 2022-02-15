import 'package:flutter/material.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.red,
        child: Text("Chart"),
        elevation: 5,
      ),
    );
  }
}

