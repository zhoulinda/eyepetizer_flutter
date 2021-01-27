import 'package:eyepetizer_flutter/model/item_banner.dart';

import 'content.dart';
import 'cover.dart';
import 'header.dart';
import 'item.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class ItemData {
  String dataType;
  int id;
  String text;
  String title;
  String description;
  String image;
  String icon;
  String actionUrl;
  String category;
  int duration;
  Cover cover;
  Header header;
  Content content;
  Detail detail;
  List<ItemBanner> itemList;

  ItemData(
      this.dataType,
      this.id,
      this.text,
      this.title,
      this.description,
      this.image,
      this.icon,
      this.actionUrl,
      this.category,
      this.duration,
      this.cover,
      this.header,
      this.content,
      this.detail,
      this.itemList);

  factory ItemData.fromJson(Map<String, dynamic> json) {
    String dataType = json['dataType'];
    int id = json['id'];
    String text = json['text'];
    String title = json['title'];
    String description = json['description'];
    String image = json['image'];
    String icon = json['icon'];
    String category = json['category'];
    int duration = json['duration'] == null ? 0 : json['duration'];
    String actionUrl = json['actionUrl'];
    Cover cover = json['cover'] == null ? null : Cover.fromJson(json['cover']);
    Header header =
        json['header'] == null ? null : Header.fromJson(json['header']);
    Content content =
        json['content'] == null ? null : Content.fromJson(json['content']);
    Detail detail =
        json['detail'] == null ? null : Detail.fromJson(json['detail']);

    var itemList = json['itemList'] as List;
    List<ItemBanner> itemBannerEntities = (itemList == null
        ? List<ItemBanner>()
        : itemList.map((e) => ItemBanner.fromJson(e)).toList());

    return ItemData(
        dataType,
        id,
        text,
        title,
        description,
        image,
        icon,
        actionUrl,
        category,
        duration,
        cover,
        header,
        content,
        detail,
        itemBannerEntities);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dataType': dataType,
        'id': id,
        'text': text,
        'title': title,
        'description': description,
        'image': image,
        'icon': icon,
        'category': category,
        'actionUrl': actionUrl,
        'cover': cover,
        'header': header,
        'content': content,
        'detail': detail,
        'itemList': itemList,
      };
}

class Detail {
  int id;
  String icon;
  String title;
  String description;
  String url;

  Detail(this.id, this.icon, this.title, this.description, this.url);

  Detail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        icon = json['icon'],
        title = json['title'],
        description = json['description'],
        url = json['url'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'icon': icon,
        'title': title,
        'description': description,
        'url': url,
      };
}
