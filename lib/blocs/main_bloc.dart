import 'dart:async';

import 'package:eyepetizer_flutter/blocs/base_bloc.dart';
import 'package:eyepetizer_flutter/http/repository/community_repository.dart';
import 'package:eyepetizer_flutter/http/repository/home_repository.dart';
import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/res/strings.dart';
import 'package:eyepetizer_flutter/widgets/footer_view.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/15
///

typedef void OnLoadCompleted(LoadStatus status);

class MainBloc extends BaseBloc {
  StreamController<List<Item>> discoverStreamController =
      StreamController<List<Item>>.broadcast();

  StreamController<List<Item>> dailyStreamController =
      StreamController<List<Item>>.broadcast();

  StreamController<List<Item>> recommendStreamController =
      StreamController<List<Item>>.broadcast();

  Stream<List<Item>> get discoverStream => discoverStreamController.stream;

  Stream<List<Item>> get dailyStream => dailyStreamController.stream;

  Stream<List<Item>> get recommendStream => recommendStreamController.stream;

  Future getData(
      {String labelId, bool isRefresh, OnLoadCompleted onLoadCompleted}) {
    switch (labelId) {
      case Strings.discover:
        return getDiscoverData(onLoadCompleted: onLoadCompleted);
      case Strings.daily:
        return getDailyData(
            isRefresh: isRefresh, onLoadCompleted: onLoadCompleted);
      case Strings.recommend:
        return getRecommendData(
            isRefresh: isRefresh, onLoadCompleted: onLoadCompleted);
      default:
        return getDailyData(
            isRefresh: isRefresh, onLoadCompleted: onLoadCompleted);
    }
  }

  Future onLoadMore(
      {String labelId,
      bool isRefresh,
      bool isReload,
      OnLoadCompleted onLoadCompleted}) {
    return getData(
        labelId: labelId,
        isRefresh: isRefresh,
        onLoadCompleted: onLoadCompleted);
  }

  Future onRefresh({String labelId, bool isRefresh, bool isReload}) {
    return getData(labelId: labelId, isRefresh: isRefresh);
  }

  @override
  void dispose() {
    discoverStreamController.close();
    dailyStreamController.close();
    recommendStreamController.close();
  }

  List<Item> discoverItems = List();
  List<Item> dailyItems = List();
  List<Item> recommendItems = List();

  Future getDiscoverData({OnLoadCompleted onLoadCompleted}) async {
    BaseListData baseListData = await HomeRepository.getDiscoverData();
    if (baseListData != null &&
        baseListData.itemList != null &&
        baseListData.itemList.length > 0) {
      discoverItems.clear();
      discoverItems.addAll(baseListData.itemList);
    }
    discoverStreamController.sink.add(discoverItems);
  }

  String dailyNextPageUrl;

  Future getDailyData({bool isRefresh, OnLoadCompleted onLoadCompleted}) async {
    BaseListData baseListData = await HomeRepository.getDailyData(
        nextPageUrl: isRefresh ? "" : dailyNextPageUrl);
    dailyNextPageUrl = baseListData.nextPageUrl;
    if (baseListData.itemList != null && baseListData.itemList.length > 0) {
      if (isRefresh) {
        dailyItems.clear();
      }
      dailyItems.addAll(baseListData.itemList);
    }
    dailyStreamController.sink.add(dailyItems);
    if (onLoadCompleted != null) {
      onLoadCompleted(LoadStatus.completed);
    }
  }

  String recommendNextPageUrl;

  Future getRecommendData(
      {bool isRefresh, OnLoadCompleted onLoadCompleted}) async {
    BaseListData baseListData =
        await CommunityRepository.getCommunityRecommendData(
            nextPageUrl: isRefresh ? "" : recommendNextPageUrl);
    recommendNextPageUrl = baseListData.nextPageUrl;
    if (baseListData.itemList != null && baseListData.itemList.length > 0) {
      if (isRefresh) {
        recommendItems.clear();
      }
      recommendItems.addAll(baseListData.itemList);
    }
    recommendStreamController.sink.add(recommendItems);
    if (onLoadCompleted != null) {
      onLoadCompleted(LoadStatus.completed);
    }
  }
}
