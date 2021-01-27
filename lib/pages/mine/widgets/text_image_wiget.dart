import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/26
///
class TextImageWidget extends StatelessWidget {
  const TextImageWidget({Key key, this.icon, this.space, this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  final int space;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon == null ? Icons.star : icon),
        SizedBox(width: space == 0 ? space : 10),
        Text(text == null ? "" : text,
            style: TextStyle(fontSize: 13, color: Colors.grey))
      ],
    );
  }
}
