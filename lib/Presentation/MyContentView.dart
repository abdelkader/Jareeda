import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:jareeda/SpinnerWidget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  double _fontSize = 18.0;

  changeFontSize(double size) => _saveFontSizeToPrefs(size);

  @override
  void initState() {
    super.initState();
    _loadFontSizeFromPrefs();
  }

  void _saveFontSizeToPrefs(double size) async {
    final prefs = await SharedPreferences.getInstance();

    double newFontSize = _fontSize + size;
    await prefs.setDouble('fontSize', newFontSize);

    setState(() {
      _fontSize = newFontSize;
    });
  }

  void _loadFontSizeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    double fontSize = prefs.getDouble('fontSize');
    if (fontSize == null) {
      fontSize = 18.0;
    }

    setState(() {
      _fontSize = fontSize;
    });
  }

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
