
import 'package:conf_world/model/screens/world_map_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

class MapRoute extends StatefulWidget {
  final String filter;

  const MapRoute({Key key, this.filter = 'false'}) : super(key: key);

  @override
  MapRouteState createState() => MapRouteState(this.filter);
}

class MapRouteState extends State<MapRoute> {
  WorldMapModel model;

  MapRouteState(String filter) {
    this.model = WorldMapModel(filter);
  }

  updateMap() {
    setState(() {});
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
          markers: model.getMarkers()
        ),
      ],
    );
  }
}
