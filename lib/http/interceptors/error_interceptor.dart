import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/http/code.dart';
import 'package:eyepetizer_flutter/utils/net_util.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(Response(data: {'code': Code.NETWORK_ERROR}));
    }
    return options;
  }
}
