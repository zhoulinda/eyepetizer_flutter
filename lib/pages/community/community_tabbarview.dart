import 'package:eyepetizer_flutter/pages/community/recommend_page.dart';
import 'package:flutter/material.dart';

import 'attention_page.dart';

class CommunityTabBarView extends StatelessWidget {
  final TabController tabController;

  CommunityTabBarView({Key key, @required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewList = [RecommendPage(), AttentionPage()];
    return TabBarView(
      children: viewList,
      controller: tabController,
    );
  }
}
