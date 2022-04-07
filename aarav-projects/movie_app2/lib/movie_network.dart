import 'package:http/http.dart' as http;

class Download{
  Future<String> getResponseFromApi() async{
    String url = "https://webhook.site/f458a3bd-86f5-4a46-b48b-a523d6faeecf";

    var uri_1 = Uri.parse(url);

    var client = http.Client();

    var response = await client.get(uri_1);

    return response.body;
  }


}