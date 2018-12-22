import 'dart:convert';
import 'package:keep_love_flutter/api/api.dart';
import 'package:keep_love_flutter/model/pins_cell.dart';
import 'package:keep_love_flutter/util/net_utils.dart';

import '../model/index_cell.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

class DataUtils{
  static Future<String> _loadIndexListAsset() async{
    return await rootBundle.loadString('assets/indexListData.json');
  }
  static Future<List<IndexCell>> getIndexListData(
      Map<String, dynamic> params) async {
    var response = await NetUtils.get(Api.RANK_LIST, params: params);
    var responseList = response['d']['entrylist'];
    List<IndexCell> resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try{
        IndexCell cellData = new IndexCell.fromJson(responseList[i]);
        resultList.add(cellData);
      }catch (e){
        print('Something really unknown: $i');
      }
    }
    return resultList;
  }
  static Future<List<PinsCell>> getPinsListData(
      Map<String, dynamic> params) async {
    List<PinsCell> resultList = new List();
    var response = await NetUtils.get(Api.PINS_LIST, params: params);
    var responseList = response['d']['list'];
    for (int i = 0; i < responseList.length; i++) {
      PinsCell pinsCell;
      try {
        pinsCell = PinsCell.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(pinsCell);
    }

    return resultList;
  }
}