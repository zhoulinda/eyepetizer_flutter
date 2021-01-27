import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/column_item_card.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/title_card.dart';
import 'package:flutter/cupertino.dart';

/// 描述 :    专题策划Card
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/16
///
class ColumnCard extends StatelessWidget {
  const ColumnCard({Key key, this.data}) : super(key: key);

  final Item data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCard(
          tag: "DISCOVER_PAGE",
          title: "专题策划",
        ),
        Container(
            height: 200,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 2.0),
                itemCount: data.data.itemList.length,
                itemBuilder: (context, index) {
                  return ColumnItemCard(data: data.data.itemList[index].data);
                }))
      ],
    );
  }
}
