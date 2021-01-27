import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/main_bloc.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/res/strings.dart';
import 'package:eyepetizer_flutter/utils/view_card_util.dart';
import 'package:eyepetizer_flutter/widgets/footer_view.dart';
import 'package:eyepetizer_flutter/widgets/refresh_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/staggered_view.dart';

/// 描述 :    社区->推荐
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/7
///
class RecommendPage extends StatefulWidget {
  static const String TAG = "RECOMMEND_PAGE";

  @override
  State createState() {
    return RecommendPageState();
  }
}

class RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoader = false;
  LoadStatus _loadStatus = LoadStatus.init;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    if (!isLoader) {
      isLoader = true;
      bloc.onRefresh(labelId: Strings.recommend, isRefresh: true);
    }
    return StreamBuilder<List<Item>>(
        stream: bloc.recommendStream,
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          return RefreshListView(
            onRefresh: ({bool isReload}) {
              return bloc.onRefresh(
                  labelId: Strings.recommend, isRefresh: true);
            },
            onLoadMore: () {
              setState(() {
                _loadStatus = LoadStatus.loading;
              });
              return bloc.onLoadMore(
                  labelId: Strings.recommend,
                  isRefresh: false,
                  onLoadCompleted: (LoadStatus status) {
                    setState(() {
                      _loadStatus = status;
                    });
                  });
            },
            scrollController: _scrollController,
            itemCount: snapshot.data == null ? 0 : 4,
            itemBuilder: (context, index) {
              if (index == 3) {
                return FooterView(loadStatus: _loadStatus);
              } else if (index <= 1) {
                return ViewCardUtil.getViewCard(snapshot.data[index]);
              } else {
                return StaggeredViewCard(
                    list: snapshot.data.sublist(2, snapshot.data.length));
              }
            },
          );
        });
  }
}
