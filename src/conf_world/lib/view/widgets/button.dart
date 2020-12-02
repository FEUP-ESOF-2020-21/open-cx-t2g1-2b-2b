import 'package:conf_world/model/widgets/button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  ButtonModel model;

  MyButton({Key key, String name}) : super(key: key) {
    model = ButtonModel(name : name);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(model.name,
        style: TextStyle(
          color: model.textColor,
            fontStyle: FontStyle.italic),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: model.boxColor,
      ),
      alignment: Alignment.center,
    );
  }
}
