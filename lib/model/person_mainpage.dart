/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/21
///
class PersonMainModel {
  TabInfo tabInfo;
  UserInfo userInfo;

  PersonMainModel(this.tabInfo, this.userInfo);

  PersonMainModel.fromJson(Map<String, dynamic> json)
      : tabInfo =
            json['tabInfo'] == null ? null : TabInfo.fromJson(json['tabInfo']),
        userInfo = json['userInfo'] == null
            ? UserInfo.fromJson(json['pgcInfo'])
            : UserInfo.fromJson(json['userInfo']);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'tabInfo': tabInfo, 'userInfo': userInfo};
}

class TabInfo {
  List<TabData> tabList;
  int defaultIdx;

  TabInfo(this.tabList, this.defaultIdx);

  factory TabInfo.fromJson(Map<String, dynamic> json) {
    var tabList = json['tabList'] as List;
    List<TabData> tabs = tabList.map((i) => TabData.fromJson(i)).toList();
    int defaultIdx = json['defaultIdx'];
    return TabInfo(tabs, defaultIdx);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'tabList': tabList, 'defaultIdx': defaultIdx};
}

class TabData {
  int id;
  String name;
  String apiUrl;
  int tabType;
  int nameType;

  TabData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        apiUrl = json['apiUrl'],
        tabType = json['tabType'],
        nameType = json['nameType'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'apiUrl': apiUrl,
        'tabType': tabType,
        'nameType': nameType,
      };
}

class UserInfo {
  String dataType;
  int id;
  String icon;
  String name;
  String brief;
  String gender;
  String description;
  String actionUrl;
  int followCount;
  Follow follow;
  bool self;
  String cover;
  int videoCount;
  int shareCount;
  int collectCount;
  int myFollowCount;
  String videoCountActionUrl;
  String myFollowCountActionUrl;
  String followCountActionUrl;
  String privateMessageActionUrl;
  int medalsNum;
  String medalsActionUrl;
  String tagNameExport;
  int worksRecCount;
  int worksSelectedCount;
  int birthday;
  String city;
  String university;
  String job;
  bool expert;

  UserInfo(
      this.dataType,
      this.id,
      this.icon,
      this.name,
      this.brief,
      this.gender,
      this.description,
      this.actionUrl,
      this.followCount,
      this.follow,
      this.self,
      this.cover,
      this.videoCount,
      this.shareCount,
      this.collectCount,
      this.myFollowCount,
      this.videoCountActionUrl,
      this.myFollowCountActionUrl,
      this.followCountActionUrl,
      this.privateMessageActionUrl,
      this.medalsNum,
      this.medalsActionUrl,
      this.tagNameExport,
      this.worksRecCount,
      this.worksSelectedCount,
      this.birthday,
      this.city,
      this.university,
      this.job,
      this.expert);

  UserInfo.fromJson(Map<String, dynamic> json)
      : dataType = json['dataType'],
        id = json['id'],
        icon = json['icon'] == null ? "" : json['icon'],
        name = json['name'],
        brief = json['brief'],
        gender = json['gender'],
        description = json['description'] == null ? "" : json['description'],
        actionUrl = json['actionUrl'],
        followCount = json['followCount'],
        follow =
            json['follow'] == null ? null : Follow.fromJson(json['follow']),
        self = json['self'],
        cover = json['cover'] == null ? "" : json['cover'],
        videoCount = json['videoCount'],
        shareCount = json['shareCount'],
        collectCount = json['collectCount'],
        myFollowCount = json['myFollowCount'],
        videoCountActionUrl = json['videoCountActionUrl'],
        myFollowCountActionUrl = json['myFollowCountActionUrl'],
        followCountActionUrl = json['followCountActionUrl'],
        privateMessageActionUrl = json['privateMessageActionUrl'],
        medalsNum = json['medalsNum'],
        medalsActionUrl = json['medalsActionUrl'],
        tagNameExport = json['tagNameExport'],
        worksRecCount = json['worksRecCount'],
        worksSelectedCount = json['worksSelectedCount'],
        birthday = json['birthday'],
        city = json['city'],
        university = json['university'],
        job = json['job'],
        expert = json['expert'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dataType': dataType,
        'id': id,
        'icon': icon,
        'name': name,
        'brief': brief,
        'gender': gender,
        'description': description,
        'actionUrl': actionUrl,
        'followCount': followCount,
        'follow': follow,
        'self': self,
        'cover': cover,
        'videoCount': videoCount,
        'shareCount': shareCount,
        'collectCount': collectCount,
        'myFollowCount': myFollowCount,
        'videoCountActionUrl': videoCountActionUrl,
        'myFollowCountActionUrl': myFollowCountActionUrl,
        'followCountActionUrl': followCountActionUrl,
        'privateMessageActionUrl': privateMessageActionUrl,
        'medalsNum': medalsNum,
        'medalsActionUrl': medalsActionUrl,
        'tagNameExport': tagNameExport,
        'worksRecCount': worksRecCount,
        'worksSelectedCount': worksSelectedCount,
        'birthday': birthday,
        'city': city,
        'university': university,
        'job': job,
        'expert': expert,
      };
}

class Follow {
  String itemType;
  int itemId;
  bool followed;

  Follow(this.itemType, this.itemId, this.followed);

  Follow.fromJson(Map<String, dynamic> json)
      : itemType = json['itemType'],
        itemId = json['itemId'],
        followed = json['followed'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'itemType': itemType,
        'itemId': itemId,
        'followed': followed
      };
}
