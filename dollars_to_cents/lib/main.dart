import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  var dollar = 0;
  var nickel = 0.05;
  var dime = 0.1;
  var quarter = 0.25;
  var penny = 0.01;

  var nickelCount = 0;
  var pennyCount = 0;
  var dimeCount = 0;
  var quarterCount = 0;
  var cents = 0;
  var temp = 0;

  void conversion() {
  if(dollar == dollar.roundToDouble()){
    cents = cents.round() * dollar * 100;
    quarter = quarter.floor() * cents/25;
    var remainder = cents%25;
    if(remainder >= 10){
      dime = remainder/10;
      temp = remainder%10;
    }
    if(temp>=5){
      nickel = temp/5;
      penny = temp%5;
    }
    if(temp <5 || temp ==0){
      nickel = remainder/5;
      penny = remainder % 5;
      dime = 0;
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dollars to Cents"),
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (amount){
              dollar = int.parse(amount);
            },
            keyboardType: TextInputType.number,
          ),

          ElevatedButton(onPressed: () {
            conversion();
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                content: Column(
                  children: [
                    Text("\$$dollar is $cents cents"),
                    Text("There are $quarter, $dime, $nickel and $penny")
                  ],
                ),
              );
            });
          }, child: Text("Convert"))

        ],
      ),
    );
  }
}
