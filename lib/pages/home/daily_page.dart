import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/main_bloc.dart';
import 'package:eyepetizer_flutter/http/repository/home_repository.dart';
import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/res/strings.dart';
import 'package:eyepetizer_flutter/utils/string_util.dart';
import 'package:eyepetizer_flutter/utils/view_card_util.dart';
import 'package:eyepetizer_flutter/widgets/footer_view.dart';
import 'package:eyepetizer_flutter/widgets/refresh_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    首页->日报
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class DailyPage extends StatefulWidget {
  static const String TAG = "DAILY_PAGE";

  @override
  _DailyPageState createState() {
    return _DailyPageState();
  }
}

class _DailyPageState extends State<DailyPage>
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
    MainBloc bloc = BlocProvider.of<MainBloc>(context);
    if (!isLoader) {
      isLoader = true;
      bloc.onRefresh(labelId: Strings.daily, isRefresh: true);
    }
    return StreamBuilder<List<Item>>(
        stream: bloc.dailyStream,
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          return RefreshListView(
              onRefresh: ({bool isReload}) {
                return bloc.onRefresh(labelId: Strings.daily, isRefresh: true);
              },
              onLoadMore: ({bool isReload}) {
                setState(() {
                  _loadStatus = LoadStatus.loading;
                });
                return bloc.onLoadMore(
                    labelId: Strings.daily,
                    isRefresh: false,
                    onLoadCompleted: (LoadStatus status) {
                      setState(() {
                        _loadStatus = status;
                      });
                    });
              },
              scrollController: _scrollController,
              itemCount: snapshot.data == null ? 0 : snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index == snapshot.data.length) {
                  return FooterView(loadStatus: _loadStatus);
                } else {
                  return ViewCardUtil.getViewCard(snapshot.data[index]);
                }
              });
        });
  }
}
