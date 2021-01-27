/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class Author {
  int id;
  String icon = "";
  String name;
  String description;

  Author(this.id, this.icon, this.name, this.description);

  Author.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        icon = json['icon'],
        name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'icon': icon,
        'name': name,
        'description': description,
      };
}
