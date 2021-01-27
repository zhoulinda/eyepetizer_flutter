import 'package:eyepetizer_flutter/model/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    视频信息widget
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/27
///
class VideoInfo extends StatelessWidget {
  const VideoInfo({Key key, this.data}) : super(key: key);

  final Detail data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          SizedBox(height: 5),
          Text(
            "#" + data.category,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                decoration: TextDecoration.none),
          ),
          SizedBox(height: 8),
          Text(
            data.description,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                decoration: TextDecoration.none),
          ),
          SizedBox(height: 10),
          Row(children: [
            Icon(Icons.store),
            SizedBox(width: 5),
            Text(data.consumption.collectionCount.toString(),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.none)),
            SizedBox(width: 25),
            Icon(Icons.upload_file),
            SizedBox(width: 5),
            Text(data.consumption.shareCount.toString(),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.none)),
            SizedBox(width: 25),
            Icon(Icons.download_sharp),
            SizedBox(width: 5),
            Text("已缓存",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.none)),
            SizedBox(width: 25),
            Icon(Icons.store),
            SizedBox(width: 5),
            Text("收藏",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.none)),
          ]),
        ],
      ),
    );
  }
}
