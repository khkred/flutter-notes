import 'package:flutter/material.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  DateTime selectedDate = DateTime.now();

  String petName = "";
  int petAge = 0;
  double petWeight = 0;
  String petBreed = "";

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              //Name
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Pet's Name"
                ),
                onChanged: (name) {
                  setState(() {
                    petName = name;
                  });
                },
              ),
              //Age
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Pet's Age"
                ),
                keyboardType: TextInputType.number,
                onChanged: (age) {
                  setState(() {
                    petAge = int.parse(age);
                  });
                },
              ),
              //Weight
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Pet's Weight"
                ),
                keyboardType: TextInputType.number,
                onChanged: (weight) {
                  setState(() {
                    petWeight = double.parse(weight);
                  });
                },
              ),
              //Breed
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Pet's Breed"
                ),
                onChanged: (breed) {
                  setState(() {
                    petBreed = breed;
                  });
                },
              ),
              //Vaccination we'll use a date Picker
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Pick Date"),
                    ElevatedButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Text("Date Picker"))
                  ],
                ),
              ),

              Container(
                  margin: EdgeInsets.only(top: 90),
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Upload Pet")))
            ],
          ),
        ),
      ),
    );
  }
}
