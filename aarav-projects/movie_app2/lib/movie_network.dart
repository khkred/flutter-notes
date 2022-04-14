import 'package:http/http.dart' as http;

class Download{
  String baseUrl;

  Download(this.baseUrl);
  Future<String> getResponseFromApi() async{
    //String url = "https://api.themoviedb.org/3/movie/popular?api_key=f5bfcf47f66210e0ffe754d19174d7c2&language=en-US&page=1";

    var _apiKey = "api_key=397471239b0dd70d768ec39b0d829e5f";


    //
    // String trailingUrl = "&language=en-US&page=1";

    String url = baseUrl + _apiKey;

    var uri_1 = Uri.parse(url);

    var client = http.Client();

    var response = await client.get(uri_1);

    return response.body;
  }


}