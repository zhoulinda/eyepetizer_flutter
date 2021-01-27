/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/19
///
class BaseData {
  int error;
  String msg;

  BaseData(this.error, this.msg);

  BaseData.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        msg = json['msg'];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'error': error, 'msg': msg};
}
