import 'package:conf_world/ConferenceDetails.dart';
import 'package:conf_world/ConferenceIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

class MapRoute extends StatelessWidget {
  var conferences = <ConferenceInfo>[];
  ConferenceMarker markerList;

  final String filter;

  MapRoute([this.filter = 'false']) {
    this.conferences = <ConferenceInfo>[
      new ConferenceInfo('Computer Science Conference', 'CS', 'date', 'description', 51.5, -0.09),
      new ConferenceInfo('Applied Mathematics and Physics', 'MATH', 'date', 'description', 51.53, -0.11),
      new ConferenceInfo('Robotics and AI', 'CS', 'date', 'description', 51.48, -0.08),
    ];

    this.markerList = new ConferenceMarker(this.conferences, this.filter);
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: markerList.markers
        ),
      ],
    );
  }
}
