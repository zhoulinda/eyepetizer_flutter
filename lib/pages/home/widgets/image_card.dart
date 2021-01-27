import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    海报Card
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/26
///
class ImageCard extends StatelessWidget {
  const ImageCard({Key key, this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: CoverImageWidget(imageUrl: url, borderRadius: 3));
  }
}
