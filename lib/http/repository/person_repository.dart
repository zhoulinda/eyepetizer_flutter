import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eyepetizer_flutter/model/base_list_data.dart';
import 'package:eyepetizer_flutter/model/header.dart';
import 'package:eyepetizer_flutter/model/item_banner.dart';
import 'package:eyepetizer_flutter/model/login/login.dart';
import 'package:eyepetizer_flutter/model/person_mainpage.dart';
import 'package:eyepetizer_flutter/model/upload_picture.dart';
import 'package:http_parser/http_parser.dart';

import '../api.dart';
import '../http_manager.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/21
///
class PersonRepository {
  /// 获取个人主页数据
  static Future<PersonMainModel> getPersonMainPageData(
      int id, bool isMyself) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.PERSON_HOMEPAGE,
        data: {'id': id, 'userType': isMyself ? "NORMAL" : "PGC"},
        options: Options(method: "GET"));
    PersonMainModel personHomePage = PersonMainModel.fromJson(result);
    return personHomePage;
  }

  /// 获取个人首页数据
  static Future<BaseListData> getPersonHomePageData(String targetUrl) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.PERSON_HOMEPAGE,
        targetUrl: targetUrl,
        options: Options(method: "GET"));

    BaseListData baseListData;

    List itemList = jsonDecode(jsonEncode(result['itemList']).toString());

    List<ItemBanner> banners = List();
    baseListData = BaseListData.fromJson(result);

    itemList.asMap().keys.map((e) {
      switch (itemList[e]["type"]) {
        case "videoCollectionOfHorizontalScrollCard":
          Map<String, dynamic> map =
              jsonDecode(jsonEncode(itemList[e]).toString());
          Map<String, dynamic> dataMap =
              jsonDecode(jsonEncode(map['data']).toString());
          Header header = jsonDecode(jsonEncode(map['header']).toString());
          BaseListData listData = BaseListData.fromJson(dataMap);
          listData.itemList.forEach((element) {
            ItemBannerDataEntity itemBannerDataEntity = ItemBannerDataEntity(
                element.data.dataType,
                element.data.id,
                element.data.header.title,
                "",
                element.data.header.description,
                element.data.content.data.cover.feed,
                element.data.actionUrl,
                null,
                element.data.header,
                element.data.header.icon,
                "");
            ItemBanner itemBanner =
                ItemBanner(element.type, header, itemBannerDataEntity);
            banners.add(itemBanner);
          });
          baseListData.itemList[0].data.itemList = banners;
          break;
      }
    }).toList();
    return baseListData;
  }

  ///上传图片
  static Future<UploadPicture> uploadPicture(String filePath) async {
    print("linda:  " + "filePath:   " + filePath);
    var name =
        filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath,
          filename: name, contentType: MediaType('image', '*'))
    });
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.UPLOAD_PICTURE,
        data: formData,
        options: Options(method: "POST"));
    UploadPicture uploadPicture = UploadPicture.fromJson(result);
    return uploadPicture;
  }

  ///保存个人资料
  static Future<Login> savePersonData(
      String cover,
      String avatar,
      String name,
      String gender,
      String birthday,
      String city,
      String university,
      String job,
      String description) async {
    Map<String, dynamic> result =
        await HttpManager.getInstance().request(Api.EDIT_USER_DATA,
            data: {
              'nick': name,
              'gender': gender == "男" ? "male" : "female",
              'birthday': birthday,
              'city': city,
              'university': university,
              'job': job,
              'description': description,
              'avatar': avatar,
              'cover': cover
            },
            options: Options(method: "POST"));
    Login login = Login.fromJson(result);
    return login;
  }
}
