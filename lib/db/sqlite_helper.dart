import 'package:sqflite/sqflite.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/20
///
class SQLiteHelper {
  static Database db;
  static const int _VERSION = 1;
  static const DB_NAME = "eyepetizer_flutter.db";

  static init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DB_NAME);
    db = await openDatabase(path, version: _VERSION,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      // await db.execute(
      //     'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }

  static String join(String databasesPath, String dbName) {
    return databasesPath + dbName;
  }

  ///获取当前数据库
  static Future<Database> getCurrentDatabase() async {
    if (db == null) {
      await init();
    }
    return db;
  }

  ///关闭
  static close() {
    db?.close();
    db = null;
  }
}
