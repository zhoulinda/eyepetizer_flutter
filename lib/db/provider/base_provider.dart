import 'package:eyepetizer_flutter/db/sqlite_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/25
///
abstract class BaseProvider {
  bool isTableExits = false;

  Future<Database> getDataBase(String tabName) async {
    return await open(tabName);
  }

  @mustCallSuper
  prepare(name, String createSql) async {
    Database db = await SQLiteHelper.getCurrentDatabase();
    await db.execute(createSql);
  }

  @mustCallSuper
  open(String tabName) async {
    isTableExits = await checkTableExits(tabName);
    if (!isTableExits) {
      await prepare(tableName(), tableSql());
    }
    return await SQLiteHelper.getCurrentDatabase();
  }

  ///表是否存在
  Future<bool> checkTableExits(String tableName) async {
    Database db = await SQLiteHelper.getCurrentDatabase();
    var res = await db.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  tableName();

  String tableSql();
}
