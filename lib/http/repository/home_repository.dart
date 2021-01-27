import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/db/provider/base_list_provider.dart';
import 'package:eyepetizer_flutter/http/api.dart';
import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/res/strings.dart';
import 'package:eyepetizer_flutter/utils/string_util.dart';
import '../code.dart';
import '../http_manager.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class HomeRepository {
  /// 获取发现数据
  static Future<BaseListData> getDiscoverData({String nextPageUrl}) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.DISCOVER,
        targetUrl: nextPageUrl,
        options: Options(method: "GET"));

    BaseListData dailyEntity;

    BaseListProvider provider = new BaseListProvider();
    if (result['code'] == Code.NETWORK_ERROR) {
      dailyEntity = await provider.query(Strings.discover);
    } else {
      dailyEntity = BaseListData.fromJson(result);
      provider.insert(Strings.discover, dailyEntity);
    }
    return dailyEntity;
  }

  /// 获取日报数据
  static Future<BaseListData> getDailyData({String nextPageUrl}) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.DAILY,
        targetUrl: nextPageUrl,
        options: Options(method: "GET"));

    BaseListData dailyEntity;

    BaseListProvider provider = new BaseListProvider();
    if (result['code'] == Code.NETWORK_ERROR) {
      dailyEntity = await provider.query(Strings.daily);
    } else {
      dailyEntity = BaseListData.fromJson(result);
      if (StringUtil.isEmpty(nextPageUrl)) {
        provider.insert(Strings.daily, dailyEntity);
      }
    }
    return dailyEntity;
  }
}
