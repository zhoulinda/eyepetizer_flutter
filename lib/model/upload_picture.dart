/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/6
///
class UploadPicture {
  int errorCode;
  String errorMessage;
  Item item;

  UploadPicture(this.errorCode, this.errorMessage, this.item);

  UploadPicture.fromJson(Map<String, dynamic> json)
      : errorCode = json['errorCode'],
        errorMessage = json['errorMessage'],
        item = Item.fromJson(json['item']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'errorCode': errorCode,
        'errorMessage': errorMessage,
        'item': item
      };
}

class Item {
  int width;
  int height;
  String format;
  String url;

  Item(this.width, this.height, this.format, this.url);

  Item.fromJson(Map<String, dynamic> json)
      : width = json['width'],
        height = json['height'],
        format = json['format'],
        url = json['url'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'width': width,
        'height': height,
        'format': format,
        'url': url
      };
}
