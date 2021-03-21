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
        title: Text('', style: TextStyle(fontSize: 15.0)),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 2.0),
              child: IconButton(
                icon: Icon(
                  Icons.exposure_minus_1,
                  color: Colors.white,
                ),
                onPressed: () {
                  MyHtmlView.globalKey.currentState.changeFontSize(-1);
                },
              )),
          Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'A',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.only(right: 2.0),
              child: IconButton(
                icon: Icon(
                  Icons.exposure_plus_1,
                  color: Colors.white,
                ),
                onPressed: () {
                  MyHtmlView.globalKey.currentState.changeFontSize(1);
                },
              )),
        ],
      ),
      body: Directionality(
          textDirection: this.direction, child: MyContentView(item)),
    );
  }
}
