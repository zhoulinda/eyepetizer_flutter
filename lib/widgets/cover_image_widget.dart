import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    自定义封面ImageWidget
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/23
///
class CoverImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final Widget placeholder;
  final Widget errorWidget;

  const CoverImageWidget(
      {Key key,
      this.imageUrl,
      this.width,
      this.height,
      this.borderRadius,
      this.placeholder,
      this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl,
        placeholder: (context, url) => placeholder == null
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(
                        borderRadius == null ? 0 : borderRadius))),
              )
            : placeholder,
        errorWidget: (context, url, error) => errorWidget == null
            ? Container(
                child: Center(
                child: Icon(Icons.error),
              ))
            : errorWidget,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius == null ? 0 : borderRadius)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ));
  }
}
