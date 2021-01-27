
import 'item_data.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class Item {
  String type;
  ItemData data;

  Item(this.type, this.data);

  Item.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        data = json['data'] == null ? null : ItemData.fromJson(json['data']);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': type, 'data': data};
}
