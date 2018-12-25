import 'package:flutter/material.dart';
import 'package:flutter_text/page/home_page.dart';

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Text',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}