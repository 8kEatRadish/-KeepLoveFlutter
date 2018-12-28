import 'package:flutter/material.dart';
import 'package:flutter_text/widget/first_item_widget.dart';

class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{

  _itemWidget(context,index){
    switch(index){
      case 0:return FirstItemWidget(context);
      default:return ListTile(
        leading: Icon(Icons.star_border),
        title: Text('index $index'),
        subtitle: Text('lalala'),
        trailing: Icon(Icons.arrow_downward),
      );
    }
  }

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
      body: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) => _itemWidget(context, index)
            )
    );
  }
}