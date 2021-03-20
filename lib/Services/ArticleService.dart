import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleService {
  final String baseUri = "https://dznews.herokuapp.com/api";

  Future<String> getContent(String newspaper, String id) async {
    var url = '$baseUri/$newspaper/$id';

    if (newspaper == 'echourouk') {
      url = Uri.encodeFull(url);
    }

    final res = await http.get(url);

    if (res.statusCode == 200) {
      var body = res.body;
      var content = json.decode(body) as String;

      return content;
    }

    return "";
  }
}
