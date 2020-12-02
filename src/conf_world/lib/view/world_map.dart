import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';
import '../database.dart';

class MapRoute extends StatelessWidget {
  DatabaseHelper db;
  final String filter;
  final double latitude;
  final double longitude;
  final int buttonToClick;

  MapRoute(this.filter, this.latitude, this.longitude, this.buttonToClick) {
    this.db = new DatabaseHelper();

    this.db.updateMarkers(this.filter, this.buttonToClick);
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
          markers: this.db.markerList.markers
        ),
      ],
    );
  }
}
