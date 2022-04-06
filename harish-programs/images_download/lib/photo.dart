class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  // The following constructor is used to convert json object to regular photo object

  factory Photo.fromJson(Map<String, dynamic> photoJson) => Photo(
      albumId: photoJson["albumId"],
      id: photoJson["id"],
      title: photoJson["title"],
      url: photoJson["url"],
      thumbnailUrl: photoJson["thumbnailUrl"]);
}
