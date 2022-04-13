import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> _menuPrompts = [
      'Popular is clicked',
      'Trending is clicked'
    ];

    showSnackBar(BuildContext context, int index) {
      final snackBar = SnackBar(content:  Text(_menuPrompts[index]));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Model'),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                   const PopupMenuItem(
                        value: 0,
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                   const PopupMenuItem(
                        value: 1,
                        child: Text(
                          'Trending',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ))
                  ],
            onSelected: (int index) => showSnackBar(context,index),


          )
        ],
      ),
      body: Container(),
    );
  }
}
