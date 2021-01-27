import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/model/base_data.dart';
import 'package:eyepetizer_flutter/model/login/login.dart';

import '../api.dart';
import '../http_manager.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/19
///
class LoginRepository {
  /// 获取验证码
  static Future<BaseData> getVerificationCode(String phoneNum) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.GET_VERIFICATION_CODE,
        baseUrl: Api.ACCOUNT_BASE_URL,
        data: {'telephone': phoneNum, 'type': "sms"},
        options: Options(method: "POST"));
    BaseData baseData = BaseData.fromJson(result);
    return baseData;
  }

  ///注册
  static Future<BaseData> register(
      String phoneNum, String verificationCode, String passWord) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.REGISTER,
        baseUrl: Api.ACCOUNT_BASE_URL,
        data: {
          "username": phoneNum,
          "code": verificationCode,
          "password": passWord
        },
        options: Options(method: "POST"));
    BaseData baseData = BaseData.fromJson(result);
    return baseData;
  }

  ///登录
  static Future<Login> login(String phoneNum, String passWord) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.LOGIN,
        baseUrl: Api.ACCOUNT_BASE_URL,
        data: {"username": phoneNum, "password": passWord},
        options: Options(method: "POST"));
    Login login = Login.fromJson(result);
    return login;
  }
}
