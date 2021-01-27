/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/17
///
class Consumption {
  int collectionCount;
  int shareCount;
  int replyCount;
  int realCollectionCount;

  Consumption(this.collectionCount, this.shareCount, this.replyCount,
      this.realCollectionCount);

  Consumption.fromJson(Map<String, dynamic> json)
      : collectionCount = json['collectionCount'],
        shareCount = json['shareCount'],
        replyCount = json['replyCount'],
        realCollectionCount = json['realCollectionCount'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'collectionCount': collectionCount,
        'shareCount': shareCount,
        'replyCount': replyCount,
        'realCollectionCount': realCollectionCount,
      };
}
