import 'package:flutter/material.dart';
import 'package:keep_love_flutter/model/pins_cell.dart';
import 'package:keep_love_flutter/util/data_utils.dart';
import 'package:keep_love_flutter/widgets/load_more.dart';
import 'package:keep_love_flutter/widgets/pins_list_cell.dart';

class PinsPage extends StatefulWidget{
  _PinsPageState createState() => _PinsPageState();
}

class _PinsPageState extends State<PinsPage> with AutomaticKeepAliveClientMixin{
  List<PinsCell> _listData = new List();

  Map<String, dynamic> _params = {
    "src": 'web',
    "uid": "",
    "limit": 20,
    "device_id": "",
    "token": ""
  };
  bool _isRequesting = false; //是否正在请求数据的flag
  bool _hasMore = true;
  String before = '';
  ScrollController _scrollController = new ScrollController();

  void getPinsList(bool isLoadMore) {
    if (_isRequesting || !_hasMore) return;

    if (before != '') {
      _params['before'] = before;
    }
    if (!isLoadMore) {
      _params['before'] = '';
    }
    _isRequesting = true;
    before = DateTime.now().toString().replaceFirst(RegExp(r' '), 'T') + 'Z';
    DataUtils.getPinsListData(_params).then((resultData) {
      List<PinsCell> resultList = new List();
      if (isLoadMore) {
        resultList.addAll(_listData);
      }
      resultList.addAll(resultData);
      if (this.mounted) {
        setState(() {
          _listData = resultList;
          _hasMore = resultData.length != 0;
          _isRequesting = false;
        });
      }
    });
  }


  @override
  void initState() {
    getPinsList(false);
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print('loadMore');
        getPinsList(true);
      }
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _itemBuilder(context, index) {
    if (index == _listData.length) {
      return LoadMore(_hasMore);
    }
    return PinsListCell(pinsCell: _listData[index]);
  }

  @override
  Widget build(BuildContext context) {
    if(_listData.length > 0){
      return Container(
        color: Color(0xfff4f5f5),
        child: ListView.builder(
          itemCount: _listData.length + 1,
          itemBuilder: _itemBuilder,
          controller: _scrollController,
        ),
      );
    }else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}