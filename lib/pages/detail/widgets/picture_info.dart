import 'package:eyepetizer_flutter/model/detail.dart';
import 'package:eyepetizer_flutter/pages/mine/widgets/text_image_wiget.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    图片相关信息View
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/22
///
class PictureInfo extends StatelessWidget {
  final Detail data;

  const PictureInfo({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CoverImageWidget(
                        imageUrl: data.owner.avatar,
                        width: 45,
                        height: 45,
                        borderRadius: 100),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(data.owner.nickname,
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        Text(data.owner.city,
                            style: TextStyle(fontSize: 12, color: Colors.white))
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  data.description,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text("手机摄影",
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
          Divider(height: 0.1, color: Colors.grey),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Row(children: [
                TextImageWidget(
                    icon: Icons.star_outline,
                    text: data.consumption.collectionCount.toString()),
                SizedBox(width: 15),
                TextImageWidget(
                    icon: Icons.comment,
                    text: data.consumption.replyCount.toString()),
                SizedBox(width: 15),
                TextImageWidget(
                  icon: Icons.store,
                  text: "收藏",
                ),
                Spacer(),
                Icon(Icons.share_rounded)
              ]))
        ],
      ),
    );
  }
}
