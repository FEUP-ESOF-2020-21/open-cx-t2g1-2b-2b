import 'package:conf_world/ConferenceDetails.dart';
import 'package:conf_world/ConferenceIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

class MapRoute extends StatelessWidget {
  ConferenceMarker markerList = new ConferenceMarker();

  @override
  Widget build(BuildContext context) {
    markerList.initMarkers();
    markerList.addMarker();
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
