import 'package:conf_world/model/conference_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'conference_details.dart';

class ConferenceIcon extends StatelessWidget {
  ConferenceIcon({Key key, this.conference}) : super(key: key);

  final ConferenceInfo conference;

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: [
          new Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.location_pin),
              color: Color(0xff7b2cbf),
              iconSize: 40.0,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return ConferenceDetails(
                      conference: conference,
                    );
                  },
                );
              },
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: Text(
              conference.name,
              style: TextStyle(fontSize: 14, color: Color(0xffe0aaff)),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.all(5),
            constraints: BoxConstraints.expand(width: 200, height: 45),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xff7b2cbf),
            ),

            transform: Matrix4.translationValues(0.0, -45.0, 0),
          ),
        ]
    );
  }
}