/**
 * Pet Model Class
 */

class Pet {
  final String name;
  final int age;
  final double weight;
  final String breed;
  final List<DateTime> vaccinationDates = [];


  Pet({
    required this.name,
    required this.age,
    required this.weight,
    required this.breed,
});

  void addVaccination(DateTime vaccinationDate) {
    vaccinationDates.add(vaccinationDate);
  }
}