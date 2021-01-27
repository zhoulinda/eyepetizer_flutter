import 'package:eyepetizer_flutter/model/item.dart';
import 'package:eyepetizer_flutter/pages/home/widgets/video_small_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    视屏详情页->相关视频列表
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/28
///
class RelatedVideos extends StatefulWidget {
  const RelatedVideos({Key key, this.data}) : super(key: key);

  final List<Item> data;

  @override
  _RelatedVideosState createState() {
    return _RelatedVideosState();
  }
}

class _RelatedVideosState extends State<RelatedVideos> {
  bool isShowAll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(
            height: 0.1,
            color: Colors.grey,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return VideoSmallCard(
                  width: 180, height: 100, data: getItemData(index));
            },
            itemCount: getItemCount(),
          ),
          Visibility(
            visible: isShowMoreText(),
            child: InkWell(
                onTap: () => lookMore(),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text(
                      "查看更多",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
          SizedBox(height: 5),
          Divider(
            height: 0.1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  lookMore() {
    setState(() {
      isShowAll = true;
    });
  }

  int getItemCount() {
    int itemCount;
    if (widget.data == null) {
      itemCount = 0;
    } else if (widget.data.length <= 5) {
      itemCount = widget.data.length;
    } else {
      itemCount = isShowAll ? widget.data.length : 5;
    }
    return itemCount;
  }

  bool isShowMoreText() {
    if (widget.data == null || widget.data.length <= 5) {
      return false;
    } else {
      return !isShowAll;
    }
  }

  getItemData(int index) {
    return widget.data[index];
  }
}
