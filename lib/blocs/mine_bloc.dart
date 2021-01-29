import 'dart:async';

import 'package:eyepetizer_flutter/blocs/base_bloc.dart';
import 'package:eyepetizer_flutter/config/prfs_key.dart';
import 'package:eyepetizer_flutter/model/login/login.dart';
import 'package:eyepetizer_flutter/utils/prfs_util.dart';
import 'package:package_info/package_info.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/20
///
class MineBloc extends BaseBloc {
  StreamController<Member> mineStreamController =
      StreamController<Member>.broadcast();

  StreamController<PackageInfo> packageInfoStreamController =
      StreamController<PackageInfo>.broadcast();

  Stream<Member> get userDataStream => mineStreamController.stream;

  Stream<PackageInfo> get packageInfoStream =>
      packageInfoStreamController.stream;

  @override
  void dispose() {
    mineStreamController.close();
    packageInfoStreamController.close();
  }

  getUserData() {
    PrefsUtil.getObj<Login>(PrefsKey.USER_DATA, (v) => Login.fromJson(v))
        .then((value) {
      mineStreamController.sink.add(value == null ? null : value.member);
    });
  }

  getVersion() {
    PackageInfo.fromPlatform().then((value) {
      packageInfoStreamController.sink.add(value);
    });
  }
}
