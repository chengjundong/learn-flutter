import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  String title = await getAlbumTitle();
  print('Album Title: $title');
}

Future<String> getAlbumTitle() async {
  // var url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  var url = Uri.parse('https://api.devio.org/uapi/test/test?requestPrams=11');
  var response = await http.get(url);

  if (200 == response.statusCode) {
    String jsonBody = response.body;
    var jsonEntity = jsonDecode(jsonBody);
    return jsonEntity["msg"];
  } else {
    throw http.ClientException(response.body);
  }
}