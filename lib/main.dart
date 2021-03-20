import 'package:flutter/material.dart';
import 'package:jareeda/JaridaButton.dart';

void main() {
  return runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Jareeda'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
        ),
        child: HomePage(),
      ),
    )),
  );
}

class HomePage extends StatelessWidget {
  List<JaridaButton> jareedas = [
    JaridaButton(
        'الشروق', 'echourouk', 'images/echourouk.png', TextDirection.rtl),
    JaridaButton('الخبر', 'elkhabar', 'images/elkhabar.png', TextDirection.rtl),
    JaridaButton(
        'El Watan', 'elwatan', 'images/elwatan.png', TextDirection.ltr),
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
