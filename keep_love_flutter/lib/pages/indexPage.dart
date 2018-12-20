import 'package:flutter/material.dart';

import '../util/dataUtils.dart';
import '../model/indexCell.dart';
import '../widgets/indexListCell.dart';

class IndexPage extends StatefulWidget{
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>{
  List<IndexCell> _listData;
  getList(bool isLoadMore){
    DataUtils.getIndexListData().then((resultList){
      setState(() {
        _listData = resultList;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getList(false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text('IndexPage'),
        IndexListCell(cellInfo: _listData[0],)
      ],
    );
  }
}