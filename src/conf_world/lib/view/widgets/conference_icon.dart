import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/controller/world_map_controller.dart';
import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/screens/world_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'conference_details.dart';

class ConferenceIcon extends StatelessWidget {
  final WorldMapControllerTest controller;
  final ConferenceModel model;
  int buttonToClick;

  ConferenceIcon({Key key, this.controller, this.model, this.buttonToClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Its bugged by now
    //WidgetsBinding.instance.addPostFrameCallback((_) => openSavedConference(context));
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
              style: TextStyle(fontSize: 14, color: model.markerTextColor),
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
  void openSavedConference(BuildContext context) {
    if (model.id == buttonToClick) {
      buttonToClick = -1;
      showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ConferenceDetails(
            model: model,
          );
        },
      );
    }
  }

}