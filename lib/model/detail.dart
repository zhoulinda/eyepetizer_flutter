import 'package:eyepetizer_flutter/model/cover.dart';
import 'package:eyepetizer_flutter/model/owner.dart';

import 'author.dart';
import 'consumption.dart';
import 'video_poster_bean.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/17
///
class Detail {
  int id;
  String title;
  String description;
  String category;
  String playUrl;
  int duration;
  List<Tag> tags;
  Consumption consumption;
  Owner owner;
  Author author;
  Cover cover;
  List<String> urls;
  VideoPosterBean videoPosterBean;

  Detail(
      this.id,
      this.title,
      this.description,
      this.category,
      this.playUrl,
      this.duration,
      this.tags,
      this.consumption,
      this.owner,
      this.author,
      this.cover,
      this.urls,
      this.videoPosterBean);

  factory Detail.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String title = json['title'];
    String description = json['description'];
    String category = json['category'];
    String playUrl = json['playUrl'];
    int duration = json['duration'];

    List<Tag> tags;
    if (json['tags'] != null) {
      var list = json['tags'] as List;
      tags = list.map((e) => Tag.fromJson(e)).toList();
    }

    Consumption consumption = json['consumption'] == null
        ? null
        : Consumption.fromJson(json['consumption']);
    Owner owner = json['owner'] == null ? null : Owner.fromJson(json['owner']);
    Author author =
        json['author'] == null ? null : Author.fromJson(json['author']);
    Cover cover = json['cover'] == null ? null : Cover.fromJson(json['cover']);

    List<String> urls;
    if (json['urls'] != null) {
      var urlList = json['urls'] as List;
      urls = new List<String>.from(urlList);
    }

    VideoPosterBean videoPosterBean = json['videoPosterBean'] == null
        ? null
        : VideoPosterBean.fromJson(json['videoPosterBean']);

    return Detail(id, title, description, category, playUrl, duration, tags,
        consumption, owner, author, cover, urls, videoPosterBean);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'playUrl': playUrl,
        'duration': duration,
        'tags': tags,
        'consumption': consumption,
        'owner': owner,
        'author': author,
        'cover': cover,
        'urls': urls,
        'videoPosterBean': videoPosterBean
      };
}

class Tag {
  int id;
  String name;
  String actionUrl;
  String desc;
  String headerImage;

  Tag(this.id, this.name, this.actionUrl, this.desc, this.headerImage);

  Tag.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        actionUrl = json['actionUrl'],
        desc = json['desc'],
        headerImage = json['headerImage'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'actionUrl': actionUrl,
        'desc': desc,
        'headerImage': headerImage
      };
}
