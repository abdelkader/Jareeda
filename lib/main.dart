import 'package:flutter/material.dart';
import 'package:jareeda/ArticleListPage.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Jareeda'),
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        JaridaButton(
            'الشروق', 'echourouk', 'images/echourouk.jpg', TextDirection.rtl),
        JaridaButton(
            'الخبر', 'elkhabar', 'images/elkhabar.jpg', TextDirection.rtl),
        JaridaButton(
            'El Watan', 'elwatan', 'images/elwatan.jpg', TextDirection.ltr),
        JaridaButton('Le Quotidien d\'Oran', 'quotidienOran',
            'images/quotidienoran.jpg', TextDirection.ltr)
      ],
    );
  }
}

class JaridaButton extends StatelessWidget {
  final String _title;
  final String _id;
  final String _imageurl;
  final TextDirection _textDirection;

  JaridaButton(this._title, this._id, this._imageurl, this._textDirection);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton(
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
