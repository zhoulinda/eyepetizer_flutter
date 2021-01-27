import 'package:eyepetizer_flutter/model/header.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/16
///
class ItemBanner {
  String type;
  Header header;
  ItemBannerDataEntity data;

  ItemBanner(this.type, this.header, this.data);

  ItemBanner.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        header = json['header'],
        data = json['data'] == null
            ? null
            : ItemBannerDataEntity.fromJson(json['data']);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': type, 'header': header, 'data': data};
}

class ItemBannerDataEntity {
  String dataType;
  int id;
  String title;
  String subTitle;
  String description;
  String image;
  String actionUrl;
  Label label;
  Header header;
  String icon;
  String bgPicture;

  ItemBannerDataEntity(
      this.dataType,
      this.id,
      this.title,
      this.subTitle,
      this.description,
      this.image,
      this.actionUrl,
      this.label,
      this.header,
      this.icon,
      this.bgPicture);

  ItemBannerDataEntity.fromJson(Map<String, dynamic> json)
      : dataType = json['dataType'],
        id = json['id'],
        title = json['title'],
        subTitle = json['subTitle'],
        description = json['description'],
        image = json['image'] == null ? json['bgPicture'] : json['image'],
        actionUrl = json['actionUrl'],
        label = json['label'] == null ? null : Label.fromJson(json['label']),
        header =
            json['header'] == null ? null : Header.fromJson(json['header']),
        icon = json['icon'],
        bgPicture = json['bgPicture'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dataType': dataType,
        'id': id,
        'title': title,
        'subTitle': subTitle,
        'description': description,
        'image': image,
        'actionUrl': actionUrl,
        'label': label,
        'header': header,
        'icon': icon,
        'bgPicture': bgPicture
      };
}

class Label {
  String text;

  Label(this.text);

  Label.fromJson(Map<String, dynamic> json) : text = json['text'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
      };
}
