/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/24
///
class Api {
  static const String BASE_URL = "https://baobab.kaiyanapp.com";

  static const String ACCOUNT_BASE_URL = "https://account.kaiyanapp.com";

  ///获取验证码
  static const String GET_VERIFICATION_CODE = "/v1/api/sms/initialization";

  ///注册
  static const String REGISTER = "/v2/api/register";

  ///登录
  static const String LOGIN = "/v1/api/login";

  ///首页->发现
  static const String DISCOVER = "/api/v7/index/tab/discovery";

  ///首页->日报
  static const String DAILY = "/api/v5/index/tab/feed";

  ///社区->推荐
  static const String COMMUNITY_RECOMMEND = "/api/v7/community/tab/rec";

  ///视频详情
  static const String VIDEO_DETAIL = "/api/v2/video/";

  ///相关视频列表
  static const String RELATE_VIDEO = "/api/v4/video/related";

  ///回复列表
  static const String REPLY = "/api/v2/replies/video";

  ///个人主页
  static const String PERSON_HOMEPAGE = "/api/v5/userInfo/tab";

  ///上传图片
  static const String UPLOAD_PICTURE = "/api/tools/image";

  ///编辑资料
  static const String EDIT_USER_DATA = "/api/v5/userInfo/edit";
}
