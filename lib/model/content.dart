import 'content_data.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class Content {
  String type;
  ContentData data;

  Content(this.type, this.data);

  Content.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        data = ContentData.fromJson(json['data']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'data': data,
      };
}
