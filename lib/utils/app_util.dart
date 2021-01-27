/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/27
///
class AppUtil {
  static bool isReleaseMode() {
    return bool.fromEnvironment("dart.vm.product");
  }

  static getBuildMode() {
    const bool isProfile = const bool.fromEnvironment("dart.vm.profile");
    const bool isReleaseMode = const bool.fromEnvironment("dart.vm.product");
    if (isDebug()) {
      return "debug";
    } else if (isProfile) {
      return "profile";
    } else if (isReleaseMode) {
      return "release";
    } else {
      return "Unknown type";
    }
  }

  static bool isDebug() {
    bool inDebug = false;
    assert(inDebug = true);
    return inDebug;
  }
}
