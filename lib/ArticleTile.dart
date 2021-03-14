import 'package:flutter/material.dart';
import 'package:jareeda/models/Article.dart';
import 'package:jareeda/ArticleContent.dart';

class ArticleTile extends StatelessWidget {
  final Article item;
  final String idNewspaper;
  final TextDirection direction;

  ArticleTile(this.item, this.idNewspaper, this.direction);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _title(
          item.title, TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleContent(
                    item.title, idNewspaper, item.id, direction)));
      },
    );
  }

  Widget _title(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
