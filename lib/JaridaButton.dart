import 'package:flutter/material.dart';
import 'package:jareeda/ArticleListPage.dart';

class JaridaButton extends StatelessWidget {
  final String _title;
  final String _id;
  final String _imageurl;
  final TextDirection _textDirection;

  JaridaButton(this._title, this._id, this._imageurl, this._textDirection);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ArticleListPage(_title, _id, _textDirection)));
            },
            child: Image(image: AssetImage(_imageurl))));
  }
}
