import 'package:flutter/material.dart';
import 'Screens/Starting/CombinedPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Site',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Combinedpage(),
    );
  }
}