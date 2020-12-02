import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final Color textColor = Color(0xffe0aaff);
  final Color boxColor = Color(0xff5a189a);
  final String name;

  MyButton({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name,
        style: TextStyle(
          color: textColor,
            fontStyle: FontStyle.italic),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: boxColor,
      ),
      alignment: Alignment.center,
    );
  }
}
