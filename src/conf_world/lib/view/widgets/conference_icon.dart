import 'package:conf_world/model/conference_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'conference_details.dart';

class ConferenceIcon extends StatelessWidget {
  final ConferenceModel model;

  ConferenceIcon({Key key, this.model}) : super(key: key);

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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return ConferenceDetails(
                      conference: model,
                    );
                  },
                );
              },
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
}