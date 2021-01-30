import 'package:eyepetizer_flutter/model/person_mainpage.dart';
import 'package:eyepetizer_flutter/utils/routes.dart';
import 'package:eyepetizer_flutter/widgets/cover_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/19
///
class PersonMainHeaderView extends StatelessWidget {
  const PersonMainHeaderView({Key key, this.data, this.isMySelf})
      : super(key: key);

  final PersonMainModel data;
  final bool isMySelf;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Column(children: [
              CoverImageWidget(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 180,
                  imageUrl: data.userInfo.cover),
              Container(
                padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Row(children: [
                        Text(data.userInfo.name,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                        Spacer(),
                        Visibility(
                          visible: !isMySelf,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(2.0)),
                                child: Text(
                                  "私信",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Text(
                                    "+关注",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))
                            ],
                          ),
                        )
                      ]),
                      Positioned(
                        right: 0,
                        child: Visibility(
                            visible: isMySelf,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PAGE_EDIT_PERSON_DATA,
                                    arguments: data.userInfo);
                              },
                              child: Container(
                                width: 45,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black26, width: 0.5),
                                    borderRadius: BorderRadius.circular(2.0)),
                                child: Text("编辑资料",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black)),
                              ),
                            )),
                      )
                    ]),
                    SizedBox(height: 10),
                    Text(data.userInfo.brief,
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 10),
                    Text(data.userInfo.description,
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.grey,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(data.userInfo.videoCount.toString()),
                            Text("作品")
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(data.userInfo.myFollowCount.toString()),
                          Text("关注")
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(data.userInfo.followCount.toString()),
                          Text("粉丝")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])),
        Positioned(
            left: 15,
            top: 105,
            child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, PAGE_PHOTO_VIEW,
                                  arguments: data.userInfo.icon);
                            },
                            child: CoverImageWidget(
                                imageUrl: data.userInfo.icon,
                                width: 80,
                                height: 80,
                                borderRadius: 100,
                                placeholder:
                                Image.asset('assets/images/ic_avatar.png'),
                                errorWidget: Image.asset(
                                    'assets/images/ic_avatar.png'))),
                        Positioned(
                            left: 55,
                            top: 55,
                            child: SizedBox(
                                width: 15,
                                height: 15,
                                child: Icon(Icons.badge)))
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Fluttertoast.showToast(msg: "主题徽章");
                      },
                      child: Row(
                        children: [
                          Icon(Icons.badge),
                          Text("主题徽章",
                              style: TextStyle(color: Colors.blueAccent)),
                          SizedBox(width: 5),
                          Text(data.userInfo.medalsNum.toString())
                        ],
                      ),
                    ),
                    SizedBox(width: 20)
                  ],
                )))
      ],
    );
  }
}
