import 'package:conf_world/model/conference_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConferenceDetails extends StatelessWidget {
  final ConferenceInfo conference;

  ConferenceDetails({Key key, this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Container(
          color: Colors.lightGreen,
          child: new Center(
            child: new Text(
              conference.name,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        new Container(
          color: Colors.white,
          child:  new Text(
            conference.date,
            textAlign: TextAlign.center,
          ),
        ),
        new Container(
          color: Colors.white,
          child: new Text(conference.description),
        ),
      ],
    );
  }
}
