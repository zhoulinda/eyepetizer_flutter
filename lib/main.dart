import 'dart:io';

import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/main_bloc.dart';
import 'package:eyepetizer_flutter/blocs/mine_bloc.dart';
import 'package:eyepetizer_flutter/pages/community/community_page.dart';
import 'package:eyepetizer_flutter/pages/home/home_page.dart';
import 'package:eyepetizer_flutter/pages/mine/mine_page.dart';
import 'package:eyepetizer_flutter/pages/notification_page.dart';
import 'package:eyepetizer_flutter/utils/color_util.dart';
import 'package:eyepetizer_flutter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 描述 :    主页
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
void main() {
  runApp(BlocProvider(child: MainPage(), bloc: MainBloc()));
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: ColorUtil.createMaterialColor(Color(0xffffffff)),
            backgroundColor: Colors.white),
        // initialRoute: pageMain,
        routes: routes,
        onGenerateRoute: routeFactory,
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: "HomePage"));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> pages = <Widget>[
    HomePage(),
    CommunityPage(),
    NotificationPage(),
    BlocProvider(child: MinePage(), bloc: MineBloc())
  ];
  PageController pageScroller;

  @override
  void initState() {
    super.initState();
    pageScroller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          toolbarHeight: 0,
          elevation: 0,
          // brightness: Brightness.light,
          // backgroundColor: Colors.white,
        ),
        body: PageView(
          children: pages,
          controller: pageScroller,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(label: "首页", icon: Icon(Icons.account_box)),
            BottomNavigationBarItem(label: "社区", icon: Icon(Icons.trip_origin)),
            BottomNavigationBarItem(
                label: "通知", icon: Icon(Icons.notifications_none)),
            BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
          ],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setCurrentItem(index);
          },
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ));
  }

  setCurrentItem(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
        pageScroller.animateToPage(index,
            duration: Duration(milliseconds: 1), curve: Curves.easeInOut);
      });
    }
  }
}
