import 'package:flutter/material.dart';

class CheckBoxesList extends StatefulWidget {
  const CheckBoxesList({Key? key}) : super(key: key);

  @override
  State<CheckBoxesList> createState() => _CheckBoxesListState();
}

class _CheckBoxesListState extends State<CheckBoxesList> {
  bool checkedStatus = false;
  bool listTileStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /**
           * Default Checkbox
           */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Pet Details'),
              Checkbox(
                onChanged: (bool? value) {
                  setState(() {
                    if (value == null) {
                      checkedStatus = false;
                    } else {
                      checkedStatus = value;
                    }
                  });
                  final snackBar =
                      SnackBar(content: Text("Checkbox is  $value "));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                value: checkedStatus,
              )
            ],
          ),

          /**
           * Checkbox List Tile
           */
          CheckboxListTile(
              title: Text('My Pet'),

              value: listTileStatus,

              onChanged: (bool? value){
            setState((){
              if(value==null){
                listTileStatus = false;
              }
              else{
                listTileStatus = value;
              }
            });

            final snackBar = SnackBar(content: Text('CheckboxListTile is $value'));

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          })
        ],
      ),
    );
  }
}
