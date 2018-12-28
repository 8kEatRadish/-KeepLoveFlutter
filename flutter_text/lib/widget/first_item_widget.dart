import 'package:flutter/material.dart';

class FirstItemWidget extends StatefulWidget {
  BuildContext context;

  FirstItemWidget(@required this.context);

  _FirstItemWidgetState createState() => _FirstItemWidgetState();
}

class _FirstItemWidgetState extends State<FirstItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          color: Colors.red,
          width: 2
        )
      ),
      child: Center(
        child: Text(
          'Text',
        ),
      )
    );
  }
}
