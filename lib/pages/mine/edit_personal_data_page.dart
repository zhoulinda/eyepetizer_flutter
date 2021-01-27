import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:eyepetizer_flutter/http/repository/person_repository.dart';
import 'package:eyepetizer_flutter/model/person_mainpage.dart';
import 'package:eyepetizer_flutter/pages/mine/widgets/item_person_data_input_widget.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

/// 描述 :    编辑个人资料页
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/28
///
class EditPersonDataPage extends StatefulWidget {
  const EditPersonDataPage({Key key}) : super(key: key);

  @override
  State createState() {
    return EditPersonDataState();
  }
}

class EditPersonDataState extends State<EditPersonDataPage> {
  static const String TYPE_COVER = "type_cover";
  static const String TYPE_AVATAR = "type_avatar";
  UserInfo userInfo;
  String currentType;
  File coverFile;
  File avatarFile;
  String coverUrl;
  String avatarUrl;
  final picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _universityController = TextEditingController();
  TextEditingController _jobController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    userInfo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Column(
      children: [
        Container(
            height: MediaQuery.of(context).padding.top, color: Colors.white),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
          height: 56,
          color: Colors.white,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("取消",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
              ),
              Spacer(),
              Text("编辑个人资料",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.none)),
              Spacer(),
              InkWell(
                onTap: () {
                  save();
                },
                child: Text("保存",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
              )
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            priViewCover(),
                            Positioned(
                                child: InkWell(
                              onTap: () {
                                currentType = TYPE_COVER;
                                getImage();
                              },
                              child: Icon(Icons.camera_alt_outlined),
                            ))
                          ],
                        ),
                        SizedBox(height: 10),
                        ItemPersonDataInputWidget(
                            title: "名字",
                            defaultText: userInfo.name,
                            controller: _nameController),
                        ItemPersonDataInputWidget(
                            title: "性别",
                            defaultText: userInfo.gender == "male" ? "男" : "女",
                            controller: _genderController),
                        ItemPersonDataInputWidget(
                            title: "生日",
                            defaultText: formatDate(
                                DateTime.fromMicrosecondsSinceEpoch(
                                    userInfo.birthday * 1000),
                                [yyyy, '/', mm, '/', dd]),
                            controller: _birthdayController),
                        ItemPersonDataInputWidget(
                            title: "所在地",
                            defaultText: userInfo.city,
                            controller: _cityController),
                        ItemPersonDataInputWidget(
                            title: "学校",
                            defaultText: userInfo.university,
                            controller: _universityController),
                        ItemPersonDataInputWidget(
                          title: "职业",
                          defaultText: userInfo.job,
                          controller: _jobController,
                        ),
                        ItemPersonDataInputWidget(
                            title: "简介",
                            defaultText: userInfo.description,
                            controller: _descriptionController)
                      ],
                    ),
                    Positioned(
                        left: 15,
                        top: 90,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            currentType = TYPE_AVATAR;
                            getImage();
                          },
                          child: priViewAvatar(),
                        ))
                  ],
                )
              ],
            ))
      ],
    ));
  }

  Future<void> getImage() async {
    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('相机'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('相册'),
                ),
              ),
            ],
          );
        });
  }

  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    uploadPicture(pickedFile.path);
    setState(() {
      if (pickedFile != null) {
        if (currentType == TYPE_COVER) {
          coverFile = File(pickedFile.path);
        } else if (currentType == TYPE_AVATAR) {
          avatarFile = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  priViewCover() {
    if (coverFile != null) {
      print("linda:   " + "CoverPath:   " + coverFile.path);
      return Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          child: Image.file(coverFile, fit: BoxFit.cover));
    } else {
      return CoverImageWidget(
          imageUrl: userInfo.cover,
          width: MediaQuery.of(context).size.width,
          height: 160,
          placeholder: Image.asset('assets/images/ic_launcher.png'),
          errorWidget: Container(color: Colors.grey));
    }
  }

  priViewAvatar() {
    if (avatarFile != null) {
      print("linda:   " + "avatarPath:   " + avatarFile.path);
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.blue,
            image: DecorationImage(
                //FileImage 本地图片   、NetworkImage 网络  、AssetImage资源
                image: FileImage(avatarFile),
                fit: BoxFit.cover)),
        width: 80,
        height: 80,
      );
    } else {
      return CoverImageWidget(
          imageUrl: userInfo.icon,
          width: 80,
          height: 80,
          borderRadius: 100,
          placeholder: Image.asset('assets/images/ic_launcher.png'),
          errorWidget: Container(color: Colors.grey));
    }
  }

  void uploadPicture(String filePath) {
    PersonRepository.uploadPicture(filePath).then((value) {
      if (currentType == TYPE_COVER) {
        coverUrl = value.item.url;
      } else {
        avatarUrl = value.item.url;
      }
    });
  }

  void save() {
    PersonRepository.savePersonData(
            coverUrl,
            avatarUrl,
            _nameController.text,
            _genderController.text,
            _birthdayController.text,
            _cityController.text,
            _universityController.text,
            _jobController.text,
            _descriptionController.text)
        .then((value) {
      if (value.error == 0) {
        Fluttertoast.showToast(msg: "保存成功");
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(msg: "保存失败");
      }
    });
  }
}
