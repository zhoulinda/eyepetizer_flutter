import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    社区->关注
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/7
///
class AttentionPage extends StatefulWidget {
  @override
  State createState() {
    return AttentionPageState();
  }
}

class AttentionPageState extends State<AttentionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text("Attention",
                style: TextStyle(fontSize: 60, color: Colors.pink))));
  }
}
