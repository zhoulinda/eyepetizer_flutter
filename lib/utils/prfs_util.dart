import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/24
class PrefsUtil {
  static save<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (T) {
      case String:
        prefs.setString(key, value as String);
        break;
      case int:
        prefs.setInt(key, value as int);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
    }
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  /// put object.
  static Future<bool> putObject(String key, Object value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value == null ? "" : json.encode(value));
  }

  /// get obj.
  static Future<T> getObj<T>(String key, T f(Map v), {T defValue}) {
    Future<Map> map = getObject(key);
    return map.then((value) => value == null ? defValue : f(value));
  }

  /// get object.
  static Future<Map> getObject(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _data = prefs.getString(key);
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  /// put object list.
  static Future<bool> putObjectList(String key, List<Object> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _dataList = list?.map((value) {
      return json.encode(value);
    })?.toList();
    return prefs.setStringList(key, _dataList);
  }

  /// get obj list.
  static List<T> getObjList<T>(String key, T f(Map v),
      {List<T> defValue = const []}) {
    List<Map> dataList = getObjectList(key);
    List<T> list = dataList?.map((value) {
      return f(value);
    })?.toList();
    return list ?? defValue;
  }

  /// get object list.
  static getObjectList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dataLis = prefs.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    })?.toList();
  }

// static Future<T> getData<T>(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   T res;
//   switch (T) {
//     case String:
//       res = prefs.getString(key) as T;
//       break;
//     case int:
//       res = prefs.getInt(key) as T;
//       break;
//     case bool:
//       res = prefs.getBool(key) as T;
//       break;
//     case double:
//       res = prefs.getDouble(key) as T;
//       break;
//   }
//   return res;
// }
}
