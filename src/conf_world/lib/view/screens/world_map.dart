import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:conf_world/controller/map_conference_controller.dart';

class MapRoute extends StatefulWidget {
  final String type;
  final dynamic filter;
  final double latitude;
  final double longitude;

  const MapRoute({Key key, this.type, this.filter, this.latitude, this.longitude}) : super(key: key);

  @override
  MapRouteState createState() => MapRouteState(this.type, this.filter, this.latitude, this.longitude);
}

class MapRouteState extends State<MapRoute> {
  MapConferenceController controller;

  final double latitude;
  final double longitude;

  MapRouteState(String type, dynamic filter, this.latitude, this.longitude) {
    this.controller = MapConferenceController(this, type, filter);
  }

  updateMap() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(latitude, longitude),
        zoom: 13.0,
        minZoom: 5.0,
        maxZoom: 18.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: controller.getMarkers()
        ),
      ],
      key: Key("world-map"),
    );
  }
}
