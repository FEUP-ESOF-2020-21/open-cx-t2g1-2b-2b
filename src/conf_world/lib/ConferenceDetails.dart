import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/ConferenceIcon.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class ConferenceInfo {
  final String name;
  final String type;
  final String date;
  final String description;

  final double latitude;
  final double longitude;

  ConferenceInfo(this.name, this.type, this.date, this.description, this.latitude, this.longitude);
}


class ConferenceMarker {
  var markers = <Marker>[];

  final conferences;
  final double width = 200.0;
  final double height = 50.0;
  final String filter;

  ConferenceMarker(this.conferences, this.filter) {
    _initMarkers();
  }

  void _initMarkers() {
    for(var conferenceD in conferences) {
      if((this.filter == conferenceD.type) || (this.filter == 'false')) {
        this.markers.add(new Marker(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          width: this.width,
          height: this.height,
          point: new LatLng(conferenceD.latitude, conferenceD.longitude),
          builder: (ctx) =>
          new ConferenceIcon(
            conference: conferenceD,
          ),
        ),
        );
      }
    }
  }
}

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