import 'package:eyepetizer_flutter/pages/error_page.dart';
import 'package:eyepetizer_flutter/widgets/footer_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/14
///

typedef void OnLoadMore();
typedef OnRefreshCallback = Future<void> Function({bool isReload});

class RefreshListView extends StatefulWidget {
  const RefreshListView(
      {Key key,
      @required this.scrollController,
      this.onRefresh,
      this.onLoadMore,
      this.enableRefresh: true,
      this.enableLoadMore: true,
      this.loadStatus,
      this.itemCount,
      this.itemBuilder,
      this.child})
      : super(key: key);

  final ScrollController scrollController;
  final OnRefreshCallback onRefresh;
  final OnLoadMore onLoadMore;
  final bool enableRefresh;
  final bool enableLoadMore;
  final int loadStatus;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget child;

  @override
  State createState() {
    return RefreshListViewState();
  }
}

class RefreshListViewState extends State<RefreshListView> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: widget.child == null
                ? ListView.builder(
                    controller: widget.scrollController,
                    itemBuilder: widget.itemBuilder,
                    itemCount: widget.itemCount)
                : widget.child)
      ],
    ));
  }

  void scrollControllerListener() async {
    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {
      if (widget.enableLoadMore && widget.onLoadMore != null) {
        widget.onLoadMore();
      }
    }
  }
}
