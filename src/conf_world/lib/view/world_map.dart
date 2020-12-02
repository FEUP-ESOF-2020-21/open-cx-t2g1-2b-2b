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

  MapRoute(this.filter, this.latitude, this.longitude) {
    this.db = new DatabaseHelper();

    this.db.updateMarkers(this.filter);
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(latitude, longitude),
       // center: new LatLng(51.5, -0.09),
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
