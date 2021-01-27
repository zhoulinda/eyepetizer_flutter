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
  const PersonHomePage({Key key, this.url}) : super(key: key);
  final String url;
  static const String TAG = "PERSON_HOME_PAGE";

  @override
  State createState() {
    return PersonHomePageState();
  }
}

class PersonHomePageState extends State<PersonHomePage>
    with AutomaticKeepAliveClientMixin {
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
  Widget build(BuildContext context) {
    PersonMainBloc bloc = BlocProvider.of<PersonMainBloc>(context);
    bloc.getPersonHomePageData(widget.url);
    return StreamBuilder<List<Item>>(
        stream: bloc.personHomeStream,
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          return ListView.builder(
              shrinkWrap: false,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              controller: _scrollController,
              itemBuilder: (context, index) {
                Item itemData = snapshot.data[index];
                return ViewCardUtil.getViewCard(itemData);
              },
              itemCount: snapshot.data == null ? 0 : snapshot.data.length);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
