import 'package:connectivity/connectivity.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/10
///
class NetUtil {
  ///网络是否连接
  // ignore: missing_return
  static bool isNetConnected()  {
    (Connectivity().checkConnectivity()).then((value) {
      print("linda:  " +
          " index:  " +
          value.index.toString() +
          "   type:  " +
          value.toString());
      // ignore: unrelated_type_equality_checks
      return value.toString() != ConnectivityResult.none;
    }).catchError((e){
      return false;
    });
    // ignore: unrelated_type_equality_checks
    // return connectivityResult.toString() != ConnectivityResult.none;
  }

  ///是否是WIFI
  static bool isWifi() {
    var connectivityResult = (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    return connectivityResult == ConnectivityResult.wifi;
  }

  ///是否是流量
  static bool isMobile() {
    var connectivityResult = (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    return connectivityResult == ConnectivityResult.mobile;
  }
}
