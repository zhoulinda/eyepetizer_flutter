import 'package:eyepetizer_flutter/pages/home/daily_page.dart';
import 'package:eyepetizer_flutter/pages/home/discover_page.dart';
import 'package:eyepetizer_flutter/utils/routes.dart';
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
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: TabBar(
            tabs: _tabs,
            controller: tabController,
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.label),
        body: TabBarView(
          controller: tabController,
          children: [DiscoverPage(), DailyPage()],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                            backgroundImage: new AssetImage(
                                'assets/images/ic_avatar.png'))
                    ),
                  )),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('设置'),
                  onTap: () {
                    Navigator.pushNamed(context, PAGE_SETTING);
                  })
            ],
          ),
        ));
  }
}
