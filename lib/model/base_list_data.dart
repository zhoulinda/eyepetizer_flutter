import 'package:eyepetizer_flutter/model/item.dart';

import 'header.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class BaseListData {
  int code = 0;
  List<Item> itemList;
  String nextPageUrl;
  Header header;

  BaseListData(this.code, this.itemList, this.nextPageUrl, this.header);

  factory BaseListData.fromJson(Map<String, dynamic> json) {
    int code = json['code'] == null ? 0 : json['code'];
    var list = json['itemList'] == null ? List() : json['itemList'] as List;
    List<Item> itemEntities = list.map((i) => Item.fromJson(i)).toList();
    Header header =
        json['header'] == null ? null : Header.fromJson(json['header']);
    return BaseListData(code, itemEntities, json['nextPageUrl'], header);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'itemList': itemList,
        'nextPageUrl': nextPageUrl,
        'header': header
      };

  @override
  String toString() {
    return 'BaseListData{code: $code, itemList: $itemList, nextPageUrl: $nextPageUrl, header: $header}';
  }
}
