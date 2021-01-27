/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class Header {
  int id;
  String title;
  String icon;
  String description;

  Header(this.id, this.title, this.icon, this.description);

  Header.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        icon = json['icon'],
        description = json['description'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'icon': icon,
        'description': description,
      };
}
