import 'package:eyepetizer_flutter/pages/community/attention_page.dart';
import 'package:eyepetizer_flutter/pages/community/recommend_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    社区
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<Tab> _tabs = <Tab>[
    Tab(text: '推荐'),
    Tab(text: "关注"),
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
    return Scaffold(
        appBar: TabBar(
          tabs: _tabs,
          controller: _tabController,
          labelColor: Colors.lightBlue,
        ),
        body: TabBarView(
          children: [RecommendPage(), AttentionPage()],
          controller: _tabController,
        ));
  }
}
