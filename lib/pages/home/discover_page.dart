import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/main_bloc.dart';
import 'package:eyepetizer_flutter/http/code.dart';
import 'package:eyepetizer_flutter/http/repository/home_repository.dart';
import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/error_page.dart';
import 'package:eyepetizer_flutter/res/strings.dart';
import 'package:eyepetizer_flutter/utils/view_card_util.dart';
import 'package:eyepetizer_flutter/widgets/footer_view.dart';
import 'package:eyepetizer_flutter/widgets/refresh_listview.dart';
import 'package:flutter/material.dart';

/// 描述 :    首页->发现
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
class DiscoverPage extends StatefulWidget {
  static const String TAG = "DISCOVER_PAGE";

  @override
  _DiscoverState createState() {
    return _DiscoverState();
  }
}

class _DiscoverState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoader = false;
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
      bloc.onRefresh(labelId: Strings.discover);
    }
    return StreamBuilder<List<Item>>(
        stream: bloc.discoverStream,
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          return RefreshListView(
              onRefresh: ({bool isReload}) {
                return bloc.onRefresh(
                    labelId: Strings.discover, isReload: isReload);
              },
              scrollController: _scrollController,
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, index) {
                return ViewCardUtil.getViewCard(snapshot.data[index]);
              });
        });
  }
}
