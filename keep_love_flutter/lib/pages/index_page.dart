import 'package:flutter/material.dart';

import '../util/data_utils.dart';
import '../model/index_cell.dart';
import '../widgets/index_list_cell.dart';
import '../widgets/index_list_header.dart';

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