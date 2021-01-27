import 'dart:async';

import 'package:eyepetizer_flutter/blocs/base_bloc.dart';
import 'package:eyepetizer_flutter/http/repository/detail_repository.dart';
import 'package:eyepetizer_flutter/model/detail.dart';
import 'package:eyepetizer_flutter/model/item.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/19
///
class DetailBloc extends BaseBloc {
  StreamController<Detail> detailStreamController =
      StreamController<Detail>.broadcast();

  StreamController<List<Item>> relateVideoStreamController =
      StreamController<List<Item>>.broadcast();

  StreamController<int> indexStreamController =
      StreamController<int>.broadcast();

  Stream<Detail> get detailStream => detailStreamController.stream;

  Stream<List<Item>> get relateVideoStream =>
      relateVideoStreamController.stream;

  Stream<int> get indexStream => indexStreamController.stream;

  @override
  void dispose() {
    detailStreamController.close();
    relateVideoStreamController.close();
    indexStreamController.close();
  }

  Future getDetailData(int id, {String resourceType}) async {
    DetailRepository.getVideoDetail(id, resourceType: resourceType)
        .then((value) {
      detailStreamController.sink.add(value);
    });
  }

  Future getRelateVideo(int id) async {
    DetailRepository.getRelateVideo(id).then((value) {
      List<Item> items = value.itemList
          .where((value) => value.type == "videoSmallCard")
          .toList();
      relateVideoStreamController.sink.add(items);
    });
  }

  addValue(int index){
    indexStreamController.sink.add(index);
  }
}
