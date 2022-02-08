void main() {
//   var sampleMap = {
//     'user': 'aarav',
//     'password': 'hello1234',
//     'gender': 'male'
//   };

//   print(sampleMap['user']);
//   print(sampleMap['gender']);

  final _questionsList = const [
    {
      'questionText': "Who invented Android?",
      'answers': [
        "Larry Page",
        "Mark Zuckerberg",
        "Andy Rubin",
        "Matt Le Blanc"
      ]
    },
    {
      'questionText': "What is the largest mammal on Earth?",
      'answers': ["Elephant", "Rhino", "Giraffe", "Human"]
    },
    {
      'questionText': "What is the full form of HTTP?",
      'answers': [
        "Hyper Text Telecommunication Project",
        "High Transfer Transmission Protocol",
        "Hyper Text Transfer Protocol"
      ]
    }
  ];

  print(_questionsList[0]['questionText']);
}
