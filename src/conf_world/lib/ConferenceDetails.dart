import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/ConferenceIcon.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class ConferenceInfo {
  ConferenceInfo();
/*
  final String name;
  final String type;
  final String date;
  final String description;

 */
}


class ConferenceMarker {
  ConferenceMarker();

  var markers = <Marker>[];
  final double width = 200.0;
  final double height = 50.0;

  void initMarkers() {
    this.markers = <Marker>[
      new Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        width: this.width,
        height: this.height,
        point: new LatLng(51.5, -0.09),
        builder: (ctx) =>
        new ConferenceIcon(
          name: 'Computer Science Conference',
        ),
      ),
      new Marker(
        anchorPos: AnchorPos.align(AnchorAlign.top),
        width: this.width,
        height: this.height,
        point: new LatLng(51.53, -0.11),
        builder: (ctx) =>
        new ConferenceIcon(
          name: 'Applied Mathematics and Physics',
        ),
      ),
    ];
  }

  void addMarker() {
    this.markers.add(new Marker(
      anchorPos: AnchorPos.align(AnchorAlign.top),
      width: this.width,
      height: this.height,
      point: new LatLng(51.48, -0.08),
      builder: (ctx) => new ConferenceIcon(
        name: 'Robotics and AI',
      ),
    ),
    );
  }
}

class ConferenceDetails extends StatelessWidget {
  ConferenceDetails({Key key, this.name, this.date, this.type, this.description}) : super(key: key);

  final String name;
  final String type;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: [
          new Container(
            color: Colors.lightGreen,
            child: new Center(
              child: new Text(
                  this.name,
                  textAlign: TextAlign.start,
              ),
            ),
          ),
          new Container(
            color: Colors.white,
            child:  new Text(
                  this.date,
                  textAlign: TextAlign.center,
            ),
          ),
          new Container(
            color: Colors.white,
            child: new Text(this.description),
          ),
        ],
      );
  }
}