import 'package:flutter/material.dart';
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

class MyHtmlView extends StatelessWidget {
  final String data;

  MyHtmlView(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Html(
          data: data,
        ),
      ),
    );
  }
}
