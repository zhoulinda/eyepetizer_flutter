import 'package:eyepetizer_flutter/model/consumption.dart';
import 'package:eyepetizer_flutter/model/detail.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/detail/detail_page.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/auto_play_video_card.dart';
import 'package:eyepetizer_flutter/pages/mine/widgets/text_image_wiget.dart';
import 'package:eyepetizer_flutter/utils/date_util.dart';
import 'package:eyepetizer_flutter/utils/routes.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    作品 自动播放VideoCard
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/26
///
class AutoPlayProductsVideoCard extends StatelessWidget {
  const AutoPlayProductsVideoCard({Key key, this.data}) : super(key: key);
  final Item data;

  @override
  Widget build(BuildContext context) {
    Consumption consumption = data.data.content.data.consumption;
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.pushNamed(context, PAGE_DETAIL,
              arguments: data.data.content.data.id);
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CoverImageWidget(
                        imageUrl: data.data.content.data.author.icon,
                        width: 35,
                        height: 35,
                        borderRadius: 100),
                    SizedBox(width: 10),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.data.content.data.author.name,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text(DateUtil.format(
                                        data.data.content.data.date) +
                                    "发布："),
                                Flexible(
                                  child: Text(data.data.content.data.title,
                                      softWrap: false,
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey)),
                                )
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
                SizedBox(height: 10),
                Text(data.data.content.data.description,
                    style: TextStyle(color: Colors.grey)),
                Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    children: List.generate(data.data.content.data.tags.length,
                        (index) {
                      return RawChip(
                          label: Text(data.data.content.data.tags[index].name,
                              style: TextStyle(fontSize: 10)),
                          padding: EdgeInsets.fromLTRB(3, 0, 3, 0));
                    }).toList()),
                AutoPlayVideoCard(playUrl: data.data.content.data.playUrl),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextImageWidget(
                        icon: Icons.star_outline,
                        text: consumption.collectionCount.toString()),
                    TextImageWidget(
                        icon: Icons.comment,
                        text: consumption.replyCount.toString()),
                    TextImageWidget(icon: Icons.store, text: "收藏"),
                    TextImageWidget(icon: Icons.share),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 0.1,
                )
              ],
            )));
  }
}
