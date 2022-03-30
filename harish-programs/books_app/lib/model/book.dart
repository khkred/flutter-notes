class Book {
  String name;
  String author;
  String description;

  Book({required this.name, required this.author, required this.description});

  factory Book.fromJson(Map<String, dynamic> book_json) => Book(
      name: book_json["name"],
      author: book_json["author"],
      description: book_json["description"]);
}
