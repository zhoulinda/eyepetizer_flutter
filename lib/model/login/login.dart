/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/20
///
class Login {
  int error;
  String msg;
  Member member;

  Login(this.error, this.msg, this.member);

  factory Login.fromJson(Map<String, dynamic> json) {
    int error = json['error'];
    String msg = json['msg'];
    Member member =
        json['member'] == null ? null : Member.fromJson(json['member']);
    return Login(error, msg, member);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'error': error, 'msg': msg, 'member': member};
}

class Member {
  int uid;
  String nick;
  String avatar;
  String username;
  String telephone;
  List<Device> devices;
  List<String> roles;
  String registerSource;
  bool needUpdatePassword;

  Member(this.uid, this.nick, this.avatar, this.username, this.telephone,
      this.devices, this.roles, this.registerSource, this.needUpdatePassword);

  factory Member.fromJson(Map<String, dynamic> json) {
    int uid = json['uid'];
    String nick = json['nick'];
    String avatar = json['avatar'];
    String username = json['username'];
    String telephone = json['telephone'];
    var devices = json['devices'] as List;
    List<Device> deviceList = devices == null
        ? List<Device>()
        : devices.map((i) => Device.fromJson(i)).toList();

    List<String> roles = json['roles'].cast<String>();
    String registerSource = json['registerSource'];
    bool needUpdatePassword = json['needUpdatePassword'];
    return Member(uid, nick, avatar, username, telephone, deviceList, roles,
        registerSource, needUpdatePassword);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'nick': nick,
        'avatar': avatar,
        'username': username,
        'telephone': telephone,
        'devices': devices,
        'roles': roles,
        'registerSource': registerSource,
        'needUpdatePassword': needUpdatePassword,
      };
}

class Device {
  int id;
  String udid;

  Device(this.id, this.udid);

  Device.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        udid = json['udid'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'udid': udid,
      };
}
