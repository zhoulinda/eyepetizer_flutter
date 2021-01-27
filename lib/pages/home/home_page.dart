import 'package:eyepetizer_flutter/pages/home/daily_page.dart';
import 'package:eyepetizer_flutter/pages/home/discover_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    首页
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<Tab> _tabs = <Tab>[
    Tab(text: '发现'),
    Tab(text: "日报"),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: TabBar(
          tabs: _tabs,
          controller: _tabController,
          labelColor: Colors.lightBlue,
        ),
        body: TabBarView(
          children: [DiscoverPage(), DailyPage()],
          controller: _tabController,
        ));
  }
}
