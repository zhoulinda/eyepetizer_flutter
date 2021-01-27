import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/26
///
class ThemeCard extends StatelessWidget {
  const ThemeCard({Key key, this.data}) : super(key: key);

  final Item data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 45,
                  height: 45,
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: CoverImageWidget(
                      imageUrl: data.data.icon, borderRadius: 2)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.data.title,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none)),
                  Text(data.data.description,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.none))
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.fromLTRB(6, 1, 6, 1),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.black),
                  borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
                ),
                child: Text(
                  "+关注",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              )
            ],
          ),
          SizedBox(height: 6),
          Divider(
            height: 0.1,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
