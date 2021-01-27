import 'dart:async';

import 'package:eyepetizer_flutter/blocs/base_bloc.dart';
import 'package:eyepetizer_flutter/http/repository/person_repository.dart';
import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/model/person_mainpage.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/19
///
class PersonMainBloc extends BaseBloc {
  StreamController<PersonMainModel> personMainStreamController =
      StreamController<PersonMainModel>.broadcast();

  StreamController<List<Item>> personHomeStreamController =
      StreamController<List<Item>>.broadcast();

  Stream<PersonMainModel> get personMainStream =>
      personMainStreamController.stream;

  Stream<List<Item>> get personHomeStream => personHomeStreamController.stream;

  @override
  void dispose() {
    personMainStreamController.close();
    personHomeStreamController.close();
  }

  Future getPersonMainPageData(int id, bool isMySelf) async {
    PersonRepository.getPersonMainPageData(id, isMySelf).then((value) {
      personMainStreamController.sink.add(value);
    });
  }

  Future getPersonHomePageData(String url) async {
    PersonRepository.getPersonHomePageData(url).then((value) {
      personHomeStreamController.sink.add(value.itemList);
    });
  }
}
