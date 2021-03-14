import 'package:flutter/material.dart';
import 'package:jareeda/Presentation/MyListView.dart';
import 'package:jareeda/Services/ArticleListService.dart';

class ArticleListPage extends StatelessWidget {
  final String id;
  final String title;
  final TextDirection direction;

  ArticleListPage(this.title, this.id, this.direction);

  @override
  Widget build(BuildContext context) {
    var items = ArticleListService().getArticleList(id);
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            this.title,
          )),
        ),
        body: Directionality(
            textDirection: direction,
            child: MyListView(items: items, id: id, direction: direction)));
  }
}
