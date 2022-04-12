import 'package:http/http.dart' as http;

class Download{
  Future<String> getResponseFromApi() async{
    String url = "https://api.themoviedb.org/3/movie/popular?api_key=f5bfcf47f66210e0ffe754d19174d7c2&language=en-US&page=1";

    var uri_1 = Uri.parse(url);

    var client = http.Client();

    var response = await client.get(uri_1);

    return response.body;
  }


}