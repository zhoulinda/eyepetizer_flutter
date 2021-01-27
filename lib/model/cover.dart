/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
class Cover {
  String feed;
  String detail;
  String blurred;
  String homepage;

  Cover(this.feed, this.detail, this.blurred, this.homepage);

  Cover.fromJson(Map<String, dynamic> json)
      : feed = json['feed'],
        detail = json['detail'],
        blurred = json['blurred'],
        homepage = json['homepage'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'feed': feed,
        'detail': detail,
        'blurred': blurred,
        'homepage': homepage
      };
}
