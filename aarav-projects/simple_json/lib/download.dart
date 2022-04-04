import 'package:http/http.dart' as http;

class Download{
  Future<String> getResponseFromApi() async {
    String url = "https://webhook.site/d7e903ba-79ab-485e-984a-ecbf7de15e98";

    var uri_1 = Uri.parse(url);

    var client = http.Client();

    var response = await client.get(uri_1);

    return response.body;
  }
}