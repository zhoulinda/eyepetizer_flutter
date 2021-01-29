import 'dart:async';

import 'package:eyepetizer_flutter/app/global_data.dart';
import 'package:eyepetizer_flutter/event/login_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    通知
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
class NotificationPage extends StatefulWidget {
  @override
  State createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage>
    with AutomaticKeepAliveClientMixin {
  StreamSubscription loginSubscription;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    registerListener();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Text("Notification",
                style: TextStyle(fontSize: 60, color: Colors.pink))));
  }

  void registerListener() {
    loginSubscription = bus.on<LoginEvent>().listen((event) {
      print("linda:   " + "notification 收到了登录事件");
    });
  }

  @override
  void dispose() {
    super.dispose();
    loginSubscription.cancel();
  }
}
