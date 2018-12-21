import 'package:flutter/material.dart';

import '../util/dataUtils.dart';
import '../model/indexCell.dart';
import '../widgets/indexListCell.dart';
import '../widgets/indexListHeader.dart';

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

  _readerList(context,index){
    if(index == 0){
      return IndexListHeader(false);
    }
    return IndexListCell(cellInfo: _listData[index-1],);
  }

  @override
  void initState() {
    super.initState();
    getList(false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(_listData.length);
    if(_listData.length == 0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: _listData.length + 1,
        itemBuilder: (context,index)=> _readerList(context, index),
    );
  }
}