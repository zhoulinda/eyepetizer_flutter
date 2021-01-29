import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 描述 :    轮播图Card
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/16
///
class HorizontalScrollCollectionCard extends StatelessWidget {
  const HorizontalScrollCollectionCard({Key key, this.data}) : super(key: key);

  final Item data;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        height: 50,
        alignment: Alignment.centerLeft,
        child: Text(
          data.data.header.title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 260,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                      height: 200,
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: CoverImageWidget(
                          imageUrl: data.data.itemList[index].data.image,
                          borderRadius: 3)),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                      child: Row(
                        children: [
                          CoverImageWidget(
                              imageUrl: data.data.itemList[index].data.icon,
                              width: 50,
                              height: 50,
                              borderRadius: 100),
                          SizedBox(width: 10),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.data.itemList[index].data.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                      data.data.itemList[index].data
                                          .description,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10)),
                                ],
                              )),
                          Icon(Icons.share_rounded)
                        ],
                      ))
                ],
              );
            },
            itemCount: data.data.itemList.length,
            viewportFraction: 0.95,
            loop: false),
      )
    ]);
  }
}
