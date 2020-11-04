import 'package:conf_world/ConferenceIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Conf World')),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(51.5, -0.09),
          zoom: 13.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 200.0,
                height: 50.0,
                point: new LatLng(51.5, -0.09),
                builder: (ctx) =>
                new Container(
                  child: new ConferenceIcon(
                    name: 'Computer Science Conference',
                  ),
                ),
              ),
              new Marker(
                width: 200.0,
                height: 50.0,
                point: new LatLng(51.53, -0.11),
                builder: (ctx) =>
                new Container(
                  child: new ConferenceIcon(
                    name: 'Applied Mathematics and Physics',
                  ),
                ),
              ),
              new Marker(
                width: 200.0,
                height: 50.0,
                point: new LatLng(51.48, -0.08),
                builder: (ctx) =>
                new Container(
                  child: new ConferenceIcon(
                    name: 'Robotics and AI',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}