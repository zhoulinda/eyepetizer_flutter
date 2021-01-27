import 'package:eyepetizer_flutter/model/consumption.dart';
import 'package:eyepetizer_flutter/model/detail.dart';

import 'author.dart';
import 'cover.dart';
import 'owner.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/15
///
class ContentData {
  int id;
  String title;
  String description;
  String resourceType;
  String category;
  Author author;
  Cover cover;
  String playUrl;
  int duration;
  int date;
  Consumption consumption;
  List<Tag> tags;
  Owner owner;

  ContentData(
      this.id,
      this.title,
      this.description,
      this.resourceType,
      this.category,
      this.author,
      this.cover,
      this.playUrl,
      this.duration,
      this.date,
      this.consumption,
      this.tags,
      this.owner);

  factory ContentData.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String title = json['title'];
    String description = json['description'];
    String resourceType = json['resourceType'];
    String category = json['category'];
    Author author =
        json['author'] == null ? null : Author.fromJson(json['author']);
    Cover cover = json['cover'] == null ? null : Cover.fromJson(json['cover']);
    String playUrl = json['playUrl'];
    int duration = json['duration'];
    int date = json['date'];
    Consumption consumption = json['consumption'] == null
        ? null
        : Consumption.fromJson(json['consumption']);
    var tagList = json['tags'] as List;
    List<Tag> tags = tagList == null
        ? List<Tag>()
        : tagList.map((e) => Tag.fromJson(e)).toList();
    Owner owner = json['owner'] == null ? null : Owner.fromJson(json['owner']);
    return ContentData(id, title, description, resourceType, category, author,
        cover, playUrl, duration, date, consumption, tags, owner);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'resourceType': resourceType,
        'category': category,
        'author': author,
        'cover': cover,
        'playUrl': playUrl,
        'duration': duration,
        'date': date,
        'consumption': consumption,
        'tags': tags,
        'owner': owner,
      };
}
