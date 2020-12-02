import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final Color _textColor = Color(0xffe0aaff);
  final Color _boxColor = Color(0xff5a189a);

  MyButton({Key key, this.name}) : super(key: key);

  final String name;

  // ^ Model
  // ----------------- Divide in 2
  // ↓ View

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.name,
        style: TextStyle(
          color: _textColor,
            fontStyle: FontStyle.italic),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _boxColor,
      ),
      alignment: Alignment.center,
    );
  }
}
