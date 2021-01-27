import 'package:eyepetizer_flutter/model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'staggered_item_card.dart';

/// 描述 :    瀑布流View
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/7
///
class StaggeredViewCard extends StatelessWidget {
  const StaggeredViewCard({Key key, this.list}) : super(key: key);
  final List<Item> list;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) =>
            StaggeredItemCard(data: list[index]),
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 3));
  }
}
