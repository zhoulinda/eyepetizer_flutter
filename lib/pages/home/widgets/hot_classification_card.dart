import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/title_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hot_classification_item_card.dart';

/// 描述 :    热门分类Card
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/27
///
class HotClassificationCard extends StatelessWidget {
  const HotClassificationCard({Key key, this.data}) : super(key: key);

  final Item data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCard(
          tag: "DISCOVER_PAGE",
          title: "热门分类",
        ),
        Container(
            height: 235,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 6, crossAxisSpacing: 6),
                itemCount: data.data.itemList.length,
                itemBuilder: (context, index) {
                  return HotClassificationItemCard(
                      index: index,
                      columnCount: data.data.itemList.length ~/ 2,
                      data: data.data.itemList[index].data);
                }))
      ],
    );
  }
}
