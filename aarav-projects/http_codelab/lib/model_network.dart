import 'package:http/http.dart' as http;

class ModelNetwork{
  Future<String> getPhotosFromApi(http.Client client) async{
    var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    return response.body;
  }
}