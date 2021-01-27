import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/config/config.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class CommonParameterInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.queryParameters.addAll({
      'udid': Config.UDID,
      'vc': Config.VC,
      'vn': Config.VN,
      'size': Config.SIZE,
      'deviceModel': Config.DEVICE_MODEL,
      'first_channel': Config.FIRST_CHANNEL,
      'last_channel': Config.LAST_CHANNEL,
      'system_version_code': Config.SYSTEM_VERSION_CODE
    });
    return super.onRequest(options);
  }
}
