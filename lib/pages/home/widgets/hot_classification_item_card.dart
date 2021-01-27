import 'package:eyepetizer_flutter/model/item_banner.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    热门分类ItemCard
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/27
///
class HotClassificationItemCard extends StatelessWidget {
  const HotClassificationItemCard(
      {Key key, this.index, this.columnCount, this.data})
      : super(key: key);

  final int index;
  final int columnCount;
  final ItemBannerDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CoverImageWidget(imageUrl: data.image, borderRadius: 2),
        Text(data.title,
            style: TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold))
      ],
    );
  }
}
