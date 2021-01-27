import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/home/discover_page.dart';
import 'package:eyepetizer_flutter/pages/mine/person_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    TextCard
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/25
///
class TitleCard extends StatelessWidget {
  const TitleCard({Key key, this.tag, this.title}) : super(key: key);

  final String tag;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: 50,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Visibility(
              visible: tag == DiscoverPage.TAG,
              child: Row(
                children: [
                  Text(
                    "查看更多",
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ))
        ],
      ),
    );
  }
}
