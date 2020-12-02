
import 'package:conf_world/model/screens/world_map_model.dart';
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
  WorldMapModel model;

  final double latitude;
  final double longitude;
  final int buttonToClick;

  MapRouteState(String filter, this.latitude, this.longitude, this.buttonToClick) {
    this.model = WorldMapModel(filter);

    this.db.updateMarkers(this.filter, this.buttonToClick);
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
          markers: model.getMarkers()
        ),
      ],
    );
  }
}
