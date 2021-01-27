import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/28
///
class CommentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg"),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [Text("用户名称"), Spacer(), Icon(Icons.pan_tool)],
                  ),
                  Text("回复@linda"),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg"),
                      ),
                      Column(
                        children: [Text("Mary"), Text("回复内容")],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("查看对话"),
                      SizedBox(width: 20),
                      Text("回复"),
                      SizedBox(width: 20),
                      Text("时间"),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
