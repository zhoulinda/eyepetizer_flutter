import 'dart:async';

import 'package:eyepetizer_flutter/app/global_data.dart';
import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/mine_bloc.dart';
import 'package:eyepetizer_flutter/event/login_out_event.dart';
import 'package:eyepetizer_flutter/model/login/login.dart';
import 'package:eyepetizer_flutter/utils/routes.dart';
import 'package:eyepetizer_flutter/utils/string_util.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';

import 'widgets/item_layout.dart';

/// 描述 :    我的
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
class MinePage extends StatefulWidget {
  @override
  State createState() => MinePageState();
}

class MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  StreamSubscription loginOutSubscription;

  @override
  void initState() {
    super.initState();
    registerListener();
  }

  @override
  void dispose() {
    super.dispose();
    loginOutSubscription.cancel();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    print("linda:   " + "***MinePage  build***");
    MineBloc bloc = BlocProvider.of<MineBloc>(context);
    bloc.getUserData();
    bloc.getVersion();
    return StreamBuilder(
        stream: bloc.userDataStream,
        builder: (BuildContext context, AsyncSnapshot<Member> snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (snapshot.data == null) {
                        Navigator.pushNamed(context, PAGE_LOGIN).then((value) {
                          bloc.getUserData();
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CoverImageWidget(
                            width: 80,
                            height: 80,
                            borderRadius: 100,
                            imageUrl: snapshot.data == null
                                ? ""
                                : snapshot.data.avatar,
                            placeholder:
                                Image.asset('assets/images/ic_launcher.png')),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: snapshot.data != null &&
                        !StringUtil.isEmpty(snapshot.data.nick),
                    child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.pushNamed(
                            context, PAGE_PERSON_MAIN_PAGE,
                            arguments: snapshot.data.uid),
                        child: Column(children: [
                          Text(snapshot.data == null ? "" : snapshot.data.nick,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 12)),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("查看个人主页"),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ])),
                  ),
                  Visibility(
                    visible: snapshot.data == null,
                    child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (snapshot.data == null) {
                            Navigator.pushNamed(context, PAGE_LOGIN);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                          child: Text("点击登录即可评论及发布内容",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 12)),
                        )),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.store),
                          SizedBox(width: 3),
                          Text(
                            "收藏",
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      )),
                      SizedBox(
                        width: 1,
                        height: 12,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cached),
                          SizedBox(width: 3),
                          Text("缓存", style: TextStyle(color: Colors.black54))
                        ],
                      ))
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(height: 0.1, color: Colors.black12),
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        SizedBox(height: 20),
                        ItemLayout(title: "我的关注"),
                        ItemLayout(title: "观看记录"),
                        ItemLayout(title: "通知开关"),
                        ItemLayout(title: "我的徽章"),
                        ItemLayout(title: "客服咨询"),
                        ItemLayout(title: "我要投稿"),
                        StreamBuilder<PackageInfo>(
                          stream: bloc.packageInfoStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<PackageInfo> snapshot) {
                            return ItemLayout(
                              title: "Version " +
                                  (snapshot.data == null
                                      ? "Unknown"
                                      : snapshot.data.version),
                              color: Colors.grey,
                            );
                          },
                        )
                      ])))
                ],
              ),
            ),
          );
        });
  }

  void registerListener() {
    loginOutSubscription = bus.on<LoginOutEvent>().listen((event) {
      setState(() {});
    });
  }
}
