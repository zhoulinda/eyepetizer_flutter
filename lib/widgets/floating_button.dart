import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2021/1/28
///
class FloatingButton extends StatefulWidget {
  const FloatingButton({Key key, this.controller}) : super(key: key);
  final ScrollController controller;

  @override
  State createState() => FloatingButtonState();
}

class FloatingButtonState extends State<FloatingButton> {
  bool isShowFloatBtn = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      int offset = widget.controller.offset.toInt();
      setState(() {
        if (offset > 480 && isShowFloatBtn) {
          isShowFloatBtn = false;
        } else if (offset < 480 && !isShowFloatBtn) {
          isShowFloatBtn = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isShowFloatBtn,
        child: FloatingActionButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "add");
            },
            tooltip: 'Increment',
            child: Icon(Icons.add)));
  }
}
