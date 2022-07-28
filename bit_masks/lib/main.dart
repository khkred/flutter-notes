import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _value = false;
  bool _valu = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bit Masks App"),
        ),
        body: ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Moscow'),
                    subtitle: const Text('GMT +3'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Paris'),
                    subtitle: const Text('GMT +2'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _valu,
                    value: _valu,
                    onChanged: (bool? value) {
                      setState(() {
                        _valu = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Berlin'),
                    subtitle: const Text('GMT +2'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Brussels'),
                    subtitle: const Text('GMT +2'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Amsterdam'),
                    subtitle: const Text('GMT +2'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Rome'),
                    subtitle: const Text('GMT +3'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('London'),
                    subtitle: const Text('GMT +1'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Dublin'),
                    subtitle: const Text('GMT +1'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('New York'),
                    subtitle: const Text('GMT -4'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Washington DC'),
                    subtitle: const Text('GMT -4'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('St. Louis'),
                    subtitle: const Text('GMT -5'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Los Angeles'),
                    subtitle: const Text('GMT -7'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Tokyo'),
                    subtitle: const Text('GMT +9'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Beijing'),
                    subtitle: const Text('GMT +8'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Ho Chi Mihn City'),
                    subtitle: const Text('GMT +7'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CheckboxListTile(
                    title: const Text('Mumbai'),
                    subtitle: const Text('GMT +5'),
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _value,
                    value: _value,
                    onChanged: (bool? value){
                      setState((){
                        _value = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
