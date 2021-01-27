import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    上拉加载footerView
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/14
///
class FooterView extends StatefulWidget {
  const FooterView({Key key, this.loadStatus}) : super(key: key);
  final LoadStatus loadStatus;

  @override
  State createState() {
    return FooterViewState();
  }
}

class FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.loadStatus == LoadStatus.loading ? 1.0 : 0.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                    backgroundColor: Colors.blue, strokeWidth: 2),
              ),
              SizedBox(width: 20),
              Text(getLoadStatusText(widget.loadStatus),
                  style: TextStyle(color: Colors.grey, fontSize: 10))
            ]),
      ),
    );
    // }
  }

  String getLoadStatusText(LoadStatus loadStatus) {
    String loadStatusText;
    switch (loadStatus) {
      case LoadStatus.loading:
        loadStatusText = "加载中...";
        break;
      case LoadStatus.completed:
        loadStatusText = "加载完成";
        break;
      default:
        loadStatusText = "";
    }
    return loadStatusText;
  }
}

enum LoadStatus { init, loading, completed }
