import 'dart:math';

import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/utils/routes.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/7
///
class StaggeredItemCard extends StatelessWidget {
  const StaggeredItemCard({Key key, this.data}) : super(key: key);
  final Item data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data.data.content.data.resourceType == "ugc_video") {
          Navigator.pushNamed(context, PAGE_DETAIL,
              arguments: data.data.header.id);
        } else if (data.data.content.data.resourceType == "ugc_picture") {
          Navigator.pushNamed(context, PAGE_PICTURE_DETAIL,
              arguments: data.data.content.data);
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: CoverImageWidget(
                borderRadius: 2,
                imageUrl: data.data.content.data.cover.feed,
              )),
          SizedBox(height: 5),
          Text(data.data.content.data.description,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black45, fontSize: 10)),
          SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PAGE_PERSON_MAIN_PAGE,
                        arguments: data.data.content.data.owner.uid);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: CoverImageWidget(
                    width: 20,
                    height: 20,
                    borderRadius: 100,
                    imageUrl: data.data.content.data.owner.avatar,
                  )),
              SizedBox(width: 6),
              Text(data.data.content.data.owner.nickname,
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
              Spacer(),
              Text(
                  data.data.content.data.consumption.collectionCount.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 10)),
              Icon(Icons.store, size: 15)
            ],
          )
        ],
      ),
    );
  }
}
