import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:jareeda/SpinnerWidget.dart';
import 'package:flutter_html/flutter_html.dart';

class MyContentView extends StatelessWidget {
  final Future<String> item;

  MyContentView(this.item);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: item,
      builder: (context, snapshot) {
        // operation for completed state
        if (snapshot.hasData) {
          return MyHtmlView(snapshot.data);
        }

        // spinner for uncompleted state
        return SpinnerWidget();
      },
    );
  }
}

class MyHtmlView extends StatefulWidget {
  final String data;

  MyHtmlView(this.data) : super(key: globalKey);

  static final GlobalKey<_MyHtmlViewState> globalKey = GlobalKey();

  @override
  _MyHtmlViewState createState() => _MyHtmlViewState();
}

class _MyHtmlViewState extends State<MyHtmlView> {
  var _fontSize = 18.0;

  InscreaseFontSize() => setState(() {
        _fontSize++;
      });

  DecreaseFontSize() => setState(() {
        _fontSize--;
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Html(
          data: widget.data,
          style: {"body": Style(fontSize: FontSize(_fontSize))},
        ),
      ),
    );
  }
}
