
import 'package:conf_world/controller/world_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

class MapRoute extends StatefulWidget {
  final String filter;
  final double latitude;
  final double longitude;
  final int buttonToClick;

  const MapRoute({Key key, this.filter = 'false', this.latitude, this.longitude, this.buttonToClick}) : super(key: key);

  @override
  MapRouteState createState() => MapRouteState(this.filter, this.latitude, this.longitude, this.buttonToClick);
}

class MapRouteState extends State<MapRoute> {
  WorldMapControllerTest controller;

  final double latitude;
  final double longitude;
  final int buttonToClick;

  MapRouteState(String filter, this.latitude, this.longitude, this.buttonToClick) {
    this.controller = WorldMapControllerTest(this, filter, this.buttonToClick);
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
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: controller.getMarkers()
        ),
      ],
    );
  }
}
