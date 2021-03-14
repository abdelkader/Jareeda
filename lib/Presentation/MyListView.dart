import 'package:flutter/material.dart';
import 'package:jareeda/models/Article.dart';
import 'package:jareeda/SpinnerWidget.dart';
import 'package:jareeda/ArticleTile.dart';

class MyListView extends StatelessWidget {
  final Future<List<Article>> items;
  final String id;
  final TextDirection direction;

  MyListView({this.items, this.id, this.direction});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: items,
      builder: (context, snapshot) {
        // operation for completed state
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var item = snapshot.data[index];
                return ArticleTile(item, id, direction);
              });
        }

        // spinner for uncompleted state
        return SpinnerWidget();
      },
    );
  }
}
