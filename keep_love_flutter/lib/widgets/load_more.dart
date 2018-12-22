import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget{

  final bool hasMore;

  LoadMore(this.hasMore);

  @override
  Widget build(BuildContext context) {
    if(hasMore){
      return Container(
        height: 70.0,
        child: Center(
          child: Opacity(
            opacity: 1.0,
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
            ),
          ),
        ),
      );
    }
    return Container(
      height: 70.0,
      child: Center(
        child: Text(
          '到底了啊喂',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}