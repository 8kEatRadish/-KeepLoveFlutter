import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'dart:core';
import 'package:fluro/fluro.dart';

class PinsCellPic extends StatelessWidget {
  final List<String> pics;
  List<Widget> _wrapChildren = List();
  double _picHeight = 230.0;

  PinsCellPic({Key key, this.pics}) : super(key: key);

  String _buildPicsStr() {
    String picStr = '';
    pics.forEach((ele) {
      picStr += '$ele,';
    });
    return picStr.substring(0, picStr.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    if (pics.length > 3) {
      _picHeight = 190.0;
    }
    for (int i = 0; i < pics.length; i += 3) {
      List<Widget> _tempRow = List();
      _tempRow.add(
        Expanded(
          child: InkWell(
            onTap: () {
              Application.router.navigateTo(context,
                  '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${i.toString()}',transition: TransitionType.fadeIn);
            },
            child: new CachedNetworkImage(
              placeholder: new Center(
                child: new CircularProgressIndicator(),
              ),
              imageUrl:pics[i],
              fit: BoxFit.cover,
              height: _picHeight,
            ),
          ),
          flex: 1,
        ),
      );
      if (i + 1 < pics.length) {
        _tempRow.add(
          SizedBox(
            width: 10.0,
          ),
        );
        _tempRow.add(
          Expanded(
            child: InkWell(
              onTap: () {
                Application.router.navigateTo(context,
                    '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${(i+1).toString()}');
              },
              child: new CachedNetworkImage(
                placeholder: new Center(
                  child: new CircularProgressIndicator(),
                ),
                imageUrl:pics[i + 1],
                fit: BoxFit.cover,
                height: _picHeight,
              ),
            ),
            flex: 1,
          ),
        );
      }
      if (i + 2 < pics.length) {
        _tempRow.add(
          SizedBox(
            width: 10.0,
          ),
        );
        _tempRow.add(
          Expanded(
            child: InkWell(
              onTap: () {
                Application.router.navigateTo(context,
                    '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${(i+2).toString()}');
              },
              child: new CachedNetworkImage(
                placeholder: new Center(
                  child: new CircularProgressIndicator(),
                ),
                imageUrl:pics[i + 2],
                fit: BoxFit.cover,
                height: _picHeight,
              ),
            ),
            flex: 1,
          ),
        );
      }
      _wrapChildren.add(Container(
        child: Row(
          children: _tempRow,
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
      ));
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Wrap(
        children: _wrapChildren,
      ),
    );
  }
}