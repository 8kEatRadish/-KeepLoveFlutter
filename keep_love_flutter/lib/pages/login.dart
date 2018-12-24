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
    return Scaffold(
        appBar: AppBar(
          title: Text('登陆'),
        ),
        body: Scaffold(
          backgroundColor: Colors.white30,
          body: Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(isHide ? _erer_hide : _erer),
                    Image.asset('images/logo.png'),
                    Image.asset(isHide ? _sansan_hide : _sansan)
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onTap: _notHide,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            icon: Icon(Icons.person),
                            labelText: '请输入用户名',
                          ),
                          onChanged: _userNameChange,
                          autofocus: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            icon: Icon(Icons.security),
                            labelText: '请输入密码',
                          ),
                          onChanged: _passwordChange,
                          autofocus: false,
                          obscureText: true,
                          onTap: _hide,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          onPressed: () {
                            if (_userName != '' && _password != '') {
                              Application.router.pop(context);
                              ApplicationEvent.event
                                  .fire(UserLoginEvent(_userName, _userPic));
                            }
                          },
                          color: Theme.of(context).primaryColor,
                          child: Text('登陆',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
