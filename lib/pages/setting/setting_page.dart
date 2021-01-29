import 'package:eyepetizer_flutter/app/global_data.dart';
import 'package:eyepetizer_flutter/config/prfs_key.dart';
import 'package:eyepetizer_flutter/db/provider/base_list_provider.dart';
import 'package:eyepetizer_flutter/db/sqlite_helper.dart';
import 'package:eyepetizer_flutter/event/login_out_event.dart';
import 'package:eyepetizer_flutter/utils/prfs_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/28
///
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  clearCache();
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    color: Colors.white,
                    child: Text("清除缓存",
                        style: TextStyle(fontSize: 16, color: Colors.black)))),
            SizedBox(height: 15),
            InkWell(
                onTap: () {
                  loginOut();
                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    color: Colors.white,
                    child: Text("退出登录",
                        style: TextStyle(fontSize: 16, color: Colors.black)))),
          ],
        ),
      ),
    );
  }

  ///退出登录
  void loginOut() {
    PrefsUtil.remove(PrefsKey.USER_DATA);
    bus.fire(LoginOutEvent());
  }

  ///清除缓存
  void clearCache() async {
    PrefsUtil.clear();
    var databasesPath = await getDatabasesPath();
    String path = SQLiteHelper.join(databasesPath, SQLiteHelper.DB_NAME);
    deleteDatabase(path);
  }
}
