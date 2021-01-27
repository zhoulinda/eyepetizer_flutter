import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    个人主页->专辑
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/21
///
class PersonArtistPage extends StatelessWidget {
  const PersonArtistPage({Key key, this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("专辑")));
  }
}
