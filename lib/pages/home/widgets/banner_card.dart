import 'package:eyepetizer_flutter/model/item_data.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/image_card.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/24
///
class BannerCard extends StatelessWidget {
  const BannerCard({Key key, this.type, this.data}) : super(key: key);

  final String type;
  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ImageCard(url: data.image),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              CoverImageWidget(
                  imageUrl: data.header.icon,
                  width: 50,
                  height: 50,
                  borderRadius: 100),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.header.title,
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                  Text(data.header.description,
                      style: TextStyle(color: Colors.grey, fontSize: 10))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
