import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/person_main_bloc.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/utils/view_card_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    个人主页->首页/作品
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/21
///
class PersonHomePage extends StatefulWidget {
  const PersonHomePage({Key key, this.url, this.tabName}) : super(key: key);
  final String url;
  final String tabName;

  @override
  State createState() => PersonHomePageState();
}

class PersonHomePageState extends State<PersonHomePage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    PersonMainBloc bloc = BlocProvider.of<PersonMainBloc>(context);
    bloc.getPersonHomePageData(widget.url);
    return StreamBuilder<List<Item>>(
        stream: bloc.personHomeStream,
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Builder(builder: (BuildContext context) {
              return CustomScrollView(
                key: PageStorageKey<String>(widget.tabName),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
                      padding: const EdgeInsets.all(0),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                        return ViewCardUtil.getViewCard(snapshot.data[index]);
                      },
                              childCount: snapshot.data == null
                                  ? 0
                                  : snapshot.data.length)))
                ],
              );
            }),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
