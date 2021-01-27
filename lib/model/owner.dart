/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/7
///
class Owner {
  int uid;
  String nickname;
  String avatar;
  String city;

  Owner(this.uid, this.nickname, this.avatar, this.city);

  Owner.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        nickname = json['nickname'],
        avatar = json['avatar'],
        city = json['city'] == null ? "" : json['city'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'nickname': nickname,
        'avatar': avatar,
        'city': city
      };
}
