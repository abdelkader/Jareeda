import 'package:flutter/material.dart';
import 'package:jareeda/JaridaButton.dart';

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
  List<JaridaButton> jareedas = [
    JaridaButton(
        'الشروق', 'echourouk', 'images/echourouk.jpg', TextDirection.rtl),
    JaridaButton('الخبر', 'elkhabar', 'images/elkhabar.jpg', TextDirection.rtl),
    JaridaButton(
        'El Watan', 'elwatan', 'images/elwatan.jpg', TextDirection.ltr),
    JaridaButton('Le Quotidien d\'Oran', 'quotidienOran',
        'images/quotidienoran.jpg', TextDirection.ltr)
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: jareedas.map((e) => e).toList(),
    );
  }
}
