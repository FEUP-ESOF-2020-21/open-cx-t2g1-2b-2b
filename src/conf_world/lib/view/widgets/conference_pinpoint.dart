import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/map_conference_controller.dart';
import 'package:conf_world/model/conference_model.dart';

class ConferencePinpoint extends StatelessWidget {
  final MapConferenceController controller;
  final ConferenceModel model;

  ConferencePinpoint({Key key, this.controller, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: [
          new Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.location_pin),
              color: model.getIconColor(),
              iconSize: 40.0,
              onPressed: () => controller.showModal(context, model.id),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: Text(
              model.name,
              style: TextStyle(fontSize: 14, color: model.getTextColor()),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.all(5),
            constraints: BoxConstraints.expand(width: 200, height: 45),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: model.getIconColor(),
            ),

            transform: Matrix4.translationValues(0.0, -45.0, 0),
          ),
        ]
    );
  }
}