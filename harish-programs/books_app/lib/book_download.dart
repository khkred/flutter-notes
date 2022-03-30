import 'package:http/http.dart' as http;

class BookDownload {

  // This method will download books JSON

  Future<void> getResponseFromApi()
  async {
    // https://webhook.site/d7e903ba-79ab-485e-984a-ecbf7de15e98
    
    String url ="https://webhook.site/d7e903ba-79ab-485e-984a-ecbf7de15e98";
    //Uri
    // First Way to convert String to URI
    var uri_1 = Uri.parse(url);
    // Second way to convert String too URI 
    var uri_2 = Uri.https("webhook.site", "/d7e903ba-79ab-485e-984a-ecbf7de15e98");

    var response = await http.get(uri_1);

    print(response.body);
  }
}