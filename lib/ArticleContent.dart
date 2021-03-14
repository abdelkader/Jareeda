import 'package:flutter/material.dart';
import 'package:jareeda/Presentation/MyContentView.dart';
import 'package:jareeda/Services/ArticleService.dart';

class ArticleContent extends StatelessWidget {
  final String id;
  final String idNewspaper;

  final String title;
  final TextDirection direction;

  ArticleContent(this.title, this.idNewspaper, this.id, this.direction);

  @override
  Widget build(BuildContext context) {
    var item = ArticleService().getContent(idNewspaper, id);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        title,
        style: TextStyle(
          fontSize: 15.0,
        ),
      )),
      body: Directionality(
          textDirection: this.direction, child: MyContentView(item)),
    );
  }
}
