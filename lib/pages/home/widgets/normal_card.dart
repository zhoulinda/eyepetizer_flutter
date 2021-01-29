import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/model/item_data.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/cover_card.dart';
import 'package:eyepetizer_flutter/utils/routes.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    FollowCard
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/25
///
class NormalCard extends StatelessWidget {
  const NormalCard({Key key, this.data}) : super(key: key);

  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PAGE_DETAIL, arguments: data.header.id);
      },
      child: Container(
        child: Column(
          children: [
            CoverCard(data: data),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                color: Colors.white,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PAGE_PERSON_MAIN_PAGE,
                            arguments: data.content.data.author.id);
                      },
                      child: Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: CoverImageWidget(
                              imageUrl: data.header.icon, borderRadius: 100)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.content.data.title,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decoration: TextDecoration.none)),
                          Text(
                            data.header.description,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.share_rounded)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
