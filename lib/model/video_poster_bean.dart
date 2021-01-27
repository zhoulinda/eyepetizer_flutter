/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/23
///
class VideoPosterBean {
  double scale;
  String url;
  String fileSizeStr;

  VideoPosterBean(this.scale, this.url, this.fileSizeStr);

  VideoPosterBean.fromJson(Map<String, dynamic> json)
      : scale = json['scale'],
        url = json['url'],
        fileSizeStr = json['fileSizeStr'];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'scale': scale, 'url': url, 'fileSizeStr': fileSizeStr};
}
