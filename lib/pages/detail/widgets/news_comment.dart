import 'package:eyepetizer_flutter/pages/detail/widgets/comment_card.dart';
import 'package:flutter/cupertino.dart';

/// 描述 :    详情页最新评论列表
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/28
///
class NewsComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CommentCard();
      },
      itemCount: 15,
    );
  }
}
