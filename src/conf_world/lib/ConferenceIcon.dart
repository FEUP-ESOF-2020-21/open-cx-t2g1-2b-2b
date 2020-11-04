import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConferenceIcon extends StatelessWidget {
  ConferenceIcon({Key key, this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new RawMaterialButton(
          onPressed: () {},
          constraints: BoxConstraints.expand(width: 40, height: 40),
          fillColor: Colors.lightGreenAccent,
          child: Icon(
            Icons.people,
            size: 20,
          ),
          padding: EdgeInsets.all(10),
          shape: CircleBorder(),
        ),
        new Container(
          child: Text(this.name, style: TextStyle(fontSize: 14), textAlign: TextAlign.center,),
          padding: EdgeInsets.all(5),
          constraints: BoxConstraints.expand(width: 200, height: 45),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.lightGreenAccent,
          ),
          alignment: Alignment.center,
          transform: Matrix4.translationValues(-75.0, -45.0, 0),
        ),
      ]
    );

  }
}
