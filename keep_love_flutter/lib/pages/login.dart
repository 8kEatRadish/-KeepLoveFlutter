import 'package:flutter/material.dart';
import 'package:keep_love_flutter/event/event_bus.dart';
import 'package:keep_love_flutter/event/event_model.dart';
import '../routers/application.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _userName = '';
  String _password = '';
  String _userPic =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545664277881&di=f6cece40096e6db3797eef22c931bac8&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ftranslate%2F250%2Fw600h450%2F20181106%2FHrhu-hnprhzv4565878.jpg';
  String _erer = "images/ic_22.png";
  String _erer_hide = "images/ic_22_hide.png";
  String _sansan = "images/ic_33.png";
  String _sansan_hide = "images/ic_33_hide.png";
  bool isHide = false;

  _userNameChange(String val) {
    setState(() {
      _userName = val;
    });
  }

  _passwordChange(String val) {
    setState(() {
      _password = val;
      print(_password);
    });
  }

  _hide() {
    setState(() {
      isHide = true;
    });
  }
  _notHide(){
    setState(() {
      isHide = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isHide);
    return Scaffold(
        appBar: AppBar(
          title: Text('登陆'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(!isHide? _erer:_erer_hide,height: 100,width: 100,),
                Image.asset('images/logo.png'),
                Image.asset(!isHide? _sansan:_sansan_hide,height: 100,width: 100,)
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'shuru',
                      contentPadding: EdgeInsets.all(10.0),
                      icon: Icon(Icons.supervisor_account),
                      hintText: '请输入用户名：',
                    ),
                    autofocus: false,
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
