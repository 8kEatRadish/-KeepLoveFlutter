import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetail extends StatefulWidget{

  final String articleUrl;
  final String title;

  // ignore: invalid_required_param
  ArticleDetail(@required this.articleUrl,@required this.title);
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail>{

  bool hasLoaded = false;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();


  @override
  void initState() {
    flutterWebviewPlugin.onStateChanged.listen((state){
      if(state.type == WebViewState.finishLoad){
        setState(() {
          hasLoaded = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.articleUrl,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}