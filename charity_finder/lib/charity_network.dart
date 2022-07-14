import 'package:http/http.dart' as http;

class Download{
  String baseUrl;

  Download(this.baseUrl);
  Future<String> getResponseFromApi() async{

    var _apiKey = "api_key=ed06bd1b-6679-4c5d-a028-e2094ebd6ebd";

    String url = baseUrl + _apiKey;

    var uri_1 = Uri.parse(url);

    var client = http.Client();

    var response = await client.get(uri_1);

    return response.body;
  }


}