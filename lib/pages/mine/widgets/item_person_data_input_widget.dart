import 'package:flutter/material.dart';

/// 描述 :    编辑个人资料 输入框Item
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/28
///
class ItemPersonDataInputWidget extends StatefulWidget {
  ItemPersonDataInputWidget(
      {Key key, this.title, this.defaultText, this.controller})
      : super(key: key);
  final String title;
  final String defaultText;
  final TextEditingController controller;

  @override
  State createState() {
    return ItemPersonDataInputState(title, defaultText, controller);
  }
}

class ItemPersonDataInputState extends State<ItemPersonDataInputWidget> {
  String title;
  String defaultText;
  TextEditingController _controller;

  ItemPersonDataInputState(
      String title, String text, TextEditingController controller) {
    this.title = title;
    this.defaultText = text;
    this._controller = controller;
  }

  @override
  void initState() {
    super.initState();
    _controller.text = defaultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: TextStyle(color: Colors.black54, fontSize: 13)),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 1, color: Colors.black26)
          ],
        ));
  }
}
