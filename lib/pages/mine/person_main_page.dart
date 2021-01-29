import 'package:eyepetizer_flutter/blocs/bloc_provider.dart';
import 'package:eyepetizer_flutter/blocs/person_main_bloc.dart';
import 'package:eyepetizer_flutter/model/person_mainpage.dart';
import 'package:eyepetizer_flutter/pages/mine/person_home_page.dart';
import 'package:eyepetizer_flutter/pages/mine/widgets/person_main_header_view.dart';
import 'package:flutter/material.dart';

/// 描述 :    个人主页
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/21
///
class PersonMainPage extends StatefulWidget {
  @override
  State<PersonMainPage> createState() {
    return PersonMainPageState();
  }
}

class PersonMainPageState extends State<PersonMainPage>
    with TickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;
  bool isMySelf;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    isMySelf = args.toString().length > 4;
    PersonMainBloc bloc = BlocProvider.of<PersonMainBloc>(context);
    if (!isLoaded) {
      isLoaded = true;
      bloc.getPersonMainPageData(args, isMySelf);
    }
    return StreamBuilder<PersonMainModel>(
        stream: bloc.personMainStream,
        builder:
            (BuildContext context, AsyncSnapshot<PersonMainModel> snapshot) {
          if (snapshot.data == null) {
            return Container();
          } else {
            tabController = TabController(
                vsync: this, length: snapshot.data.tabInfo.tabList.length);
            return Scaffold(
              body: NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          sliver: SliverAppBar(
                              title: Text("开眼精选"),
                              leading: Icon(Icons.arrow_back_ios_outlined),
                              titleSpacing: -10,
                              actions: [
                                Icon(Icons.share),
                                Icon(Icons.more_horiz)
                              ],
                              pinned: true,
                              forceElevated: innerBoxIsScrolled,
                              expandedHeight: 365,
                              elevation: 0,
                              flexibleSpace: FlexibleSpaceBar(
                                  collapseMode: CollapseMode.pin,
                                  background: PersonMainHeaderView(
                                      data: snapshot.data, isMySelf: isMySelf)),
                              bottom: TabBar(
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: Colors.black,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  controller: tabController,
                                  tabs: snapshot.data.tabInfo.tabList
                                      .map((e) => Tab(text: e.name))
                                      .toList()))),
                    ];
                  },
                  body: TabBarView(
                      controller: tabController,
                      children: getPersonPages(snapshot.data))),
            );
            // )
            // ],
            // ),
          }
        });
  }

  List<Widget> getPersonPages(PersonMainModel personMainModel) {
    List<Widget> pages = List();
    personMainModel.tabInfo.tabList.forEach((element) {
      switch (element.name) {
        case "首页":
          pages.add(BlocProvider(
              child: PersonHomePage(url: element.apiUrl, tabName: element.name),
              bloc: PersonMainBloc()));
          break;
        case "作品":
          pages.add(BlocProvider(
              child: PersonHomePage(url: element.apiUrl, tabName: element.name),
              bloc: PersonMainBloc()));
          break;
        case "专辑":
          pages.add(BlocProvider(
              child: PersonHomePage(url: element.apiUrl, tabName: element.name),
              bloc: PersonMainBloc()));
          break;
      }
    });
    return pages;
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
