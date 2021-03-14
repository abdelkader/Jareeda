import 'dart:convert';
import 'package:jareeda/models/Article.dart';
import 'package:http/http.dart' as http;

class ArticleListService {
  final String baseUri = "https://dznews.herokuapp.com/api";

  Future<List<Article>> getArticleList(String id) async {
    var url = '$baseUri/$id';
    final res = await http.get(url);

    if (res.statusCode == 200) {
      var content = res.body;
      var arr = json.decode(content) as List;

      // for every element of arr map to _fromJson
      // and convert the array to list
      return arr.map((e) => _fromJson(e)).toList();
    }

    return List<Article>();
  }

  Article _fromJson(Map<String, dynamic> item) {
    return new Article(item['titre'], item['lien'], item['id']);
  }
}
