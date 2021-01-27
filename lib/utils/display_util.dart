import 'package:flutter/cupertino.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/24
///
class DisplayUtil {
  /// 是否是横屏
  static bool isLandScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height;
  }
}
