import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/model/base_list_data.dart';

import '../api.dart';
import '../http_manager.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/7
///
class CommunityRepository {
  /// 获取社区推荐数据
  static Future<BaseListData> getCommunityRecommendData(
      {String nextPageUrl}) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.COMMUNITY_RECOMMEND,
        targetUrl: nextPageUrl,
        options: Options(method: "GET"));
    BaseListData dailyEntity = BaseListData.fromJson(result);
    return dailyEntity;
  }
}
