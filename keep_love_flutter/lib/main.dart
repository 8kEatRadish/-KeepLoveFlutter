import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'pages/index_page.dart';
import 'pages/pins_page.dart';
import 'pages/book_page.dart';
import 'pages/repos_page.dart';
import 'pages/activity_page.dart';
import 'routers/routes.dart';
import 'routers/application.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  final TextStyle tabTextStyleNormal = TextStyle(
    color: const Color(0xffdddddd)
  );
  final TextStyle tabTextStyleSelected = TextStyle(
    color: const Color(0xff4d91fd)
  );
  final List<Tab> _bottomTabs = <Tab>[
    Tab(
      text: '首页',
      icon: Icon(Icons.home),
    ),
    Tab(
      text: '沸点',
      icon: Icon(Icons.chat),
    ),
    Tab(
      text: '小册',
      icon: Icon(Icons.book),
    ),
    Tab(
      text: '开源库',
      icon: Icon(Icons.bubble_chart),
    ),
    Tab(
      text: '活动',
      icon: Icon(Icons.local_activity),
    ),
  ];
  var _body;
  List _appBarTitles = ['首页','沸点','小册','开源库','活动'];
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
    // TODO: implement build
    return Container(
      child: MaterialApp(
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(primaryColor: const Color.fromRGBO(77, 145, 253, 1.0)),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Title'),
          ),
          body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                IndexPage(),
                PinsPage(),
                BookPage(),
                ReposPage(),
                ActivityPage()
              ],
          ),
          bottomNavigationBar: new Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              tabs: _bottomTabs,
              controller: _tabController,
              indicatorColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _bottomTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}