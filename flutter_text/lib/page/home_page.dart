import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Flutter Text',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical:  10
        ),
        decoration: BoxDecoration(
          color: Color(0xff10000000),
          borderRadius: BorderRadius.all(Radius.circular(3.0))
        ),
      ),
    );
  }
}