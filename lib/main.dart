import 'package:dynamic_forms/test.dart';
import 'package:flutter_validate/flutter_validate.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF33cc33)
      ),
      home: TestPage(),
    );
  }
}