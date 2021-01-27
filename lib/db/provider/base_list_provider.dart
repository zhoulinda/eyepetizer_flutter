import 'dart:convert';

import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:sqflite/sqflite.dart';

import 'base_provider.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/25

class BaseListProvider extends BaseProvider {
  static const String TAB_NAME = "base_list";
  static const String ID = "_id";
  static const String TAG = "tag";
  static const String DATA = "data";

  ///插入到数据库
  Future insert(String tag, BaseListData data) async {
    Database db = await getDataBase(TAB_NAME);
    if (await checkTableExits(TAB_NAME)) {
      await db.delete(TAB_NAME, where: '$TAG = ?', whereArgs: [tag]);
    }
    String result = jsonEncode(data.toJson());
    Map<String, dynamic> resultMap = <String, dynamic>{TAG: tag, DATA: result};
    return await db.insert(TAB_NAME, resultMap);
  }

  ///查询
  Future<BaseListData> query(String tag) async {
    Database db = await getDataBase(TAB_NAME);
    List<Map<String, dynamic>> maps = await db.query(TAB_NAME,
        columns: [ID, TAG, DATA], where: '$TAG = ?', whereArgs: [tag]);
    if (maps.length > 0) {
      Map<String, dynamic> result = maps.first;
      return BaseListData.fromJson(jsonDecode(result['$DATA']));
    }
    return null;
  }

  @override
  tableName() {
    return TAB_NAME;
  }

  @override
  String tableSql() {
    return '''create table $TAB_NAME ($ID integer primary key autoincrement,$TAG text not null,$DATA text not null)''';
  }
}
