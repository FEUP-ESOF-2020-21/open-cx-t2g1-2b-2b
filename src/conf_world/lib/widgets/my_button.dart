import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  MyButton({Key key, this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.name,
        style: TextStyle(
          color: Color(0xffe0aaff), fontStyle: FontStyle.italic),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xff5a189a),
      ),
      alignment: Alignment.center,
    );
  }
}
