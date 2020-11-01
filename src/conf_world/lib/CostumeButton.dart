import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  MyButton({Key key, this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.name),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.lightGreenAccent,
      ),
      alignment: Alignment.center,
    );
  }
}
