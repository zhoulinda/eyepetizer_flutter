import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/model/detail.dart';

import '../api.dart';
import '../http_manager.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/17
///
class DetailRepository {
  /// 获取视频详情数据
  static Future<Detail> getVideoDetail(int id, {String resourceType}) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.VIDEO_DETAIL + id.toString(),
        data: {'resourceType': resourceType},
        options: Options(method: "GET"));
    Detail detail = Detail.fromJson(result);
    return detail;
  }

  /// 获取相关视频数据
  static Future<BaseListData> getRelateVideo(int id) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.RELATE_VIDEO,
        data: {'id': id},
        options: Options(method: "GET"));
    BaseListData commonEntity = BaseListData.fromJson(result);
    return commonEntity;
  }
}
