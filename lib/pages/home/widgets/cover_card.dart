import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/model/item_data.dart';
import 'package:eyepetizer_flutter/utils/date_util.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    图片或视屏封面Card
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/26
///
///
class CoverCard extends StatelessWidget {
  const CoverCard({Key key, this.data}) : super(key: key);

  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: CoverImageWidget(
              imageUrl: data.content.data.cover.feed, borderRadius: 5),
        ),
        Positioned(
          child: Visibility(
            visible: data.content.type == "video",
            child: Container(
                width: 40.0,
                height: 20.0,
                margin: EdgeInsets.fromLTRB(0, 0, 16, 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: new BorderRadius.circular(2.0)),
                child: Text(
                    DateUtil.getDuration(data.content.type == "video"
                        ? data.content.data.duration
                        : 0),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center)),
          ),
        )
      ],
    );
  }
}
