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
      body: new Column(
          children: <Widget>[
            Container(
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
            RaisedButton(
              color: Colors.red,
              highlightColor: Colors.grey,
              onPressed: ()=>debugPrint('lalala'),
              child: Text(
                'run',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10),
            new FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: Text('lalala'),
            )
          ],
        ),
    );
  }
}