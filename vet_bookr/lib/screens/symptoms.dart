import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vet_bookr/screens/clinics_list.dart';
import 'package:vet_bookr/screens/list_pet.dart';
import 'package:vet_bookr/models/pet.dart';

class Symptoms extends StatelessWidget {
  DateTime selectedDate = DateTime.now();

  String nameController = "";
  int ageController = 0;
  double weightController = 0;
  String breedController = "";
  String vaccinationDate = "";
  String symptomsController = "";

  _selectDate(BuildContext context) async {

    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
        selectedDate = selected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptoms"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "Pet's Name"),
            onChanged: (name) {
                nameController = name;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Pet's Age"),
            onChanged: (age) {
              ageController = int.parse(age);
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Pet's Weight"),
            onChanged: (weight) {
              weightController = double.parse(weight);
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Pet's Breed"),
            onChanged: (breed) {
              breedController = breed;
            },
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(hintText: "Pet's Symptoms"),
              onChanged: (symptoms) {
                symptomsController = symptoms;
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Last Vaccination Date"),
                ElevatedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text("Select Vaccination Date"))
              ],
            ),
          ),

          Container(

              margin: const EdgeInsets.only(top: 90),
              child: ElevatedButton(
                  onPressed: () {
                    if (nameController.isEmpty ||
                        ageController == 0 ||
                        weightController == 0 ||
                        breedController.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text("One of these fields is empty"),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    } else {
                      vaccinationDate =
                      "${selectedDate.day}-${selectedDate
                          .month}-${selectedDate.year}";
                      Pet addedPet = Pet(
                          name: nameController,
                          age: ageController,
                          weight: weightController,
                          breed: breedController);
                      addedPet.addVaccination(vaccinationDate);

                      var pet = Pet(name: nameController, age: ageController, weight: weightController, breed: breedController);

                        launchUrl(Uri.parse("tel:+917799000593"));

                      addPetToFireStore(addedPet);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Clinics_List()));
                    }
                  },
                  child: Text("Upload Pet")))

        ],
      ),
    );
  }
}

Future<DocumentReference> addPetToFireStore(Pet addedPet) {
  return FirebaseFirestore.instance
      .collection('petsDetails')
      .add(<String, dynamic>{
    "petName": addedPet.name,
    "petAge": addedPet.age,
    "petWeight": addedPet.weight,
    "petBreed": addedPet.breed,
    "vaccination": addedPet.vaccinationDates
  });
}
