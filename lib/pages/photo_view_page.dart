import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

/// 描述 :    浏览大图
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/7
///
class PhotoViewPage extends StatelessWidget {
  PhotoViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Container(
      child: PhotoView(imageProvider: CachedNetworkImageProvider(args)),
    );
  }
}
