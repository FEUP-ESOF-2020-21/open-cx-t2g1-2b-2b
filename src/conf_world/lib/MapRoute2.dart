import 'package:conf_world/ConferenceIcon.dart';
import 'package:conf_world/SearchConference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';
import 'MyButton.dart';
import 'SearchConference.dart';

class MapRoute2 extends StatefulWidget {
  @override
  _MapRoute2State createState() => _MapRoute2State();
}

class _MapRoute2State extends State<MapRoute2> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    new FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              anchorPos: AnchorPos.align(AnchorAlign.top),
              width: 200.0,
              height: 50.0,
              point: new LatLng(51.5, -0.09),
              builder: (ctx) => new ConferenceIcon(
                name: 'Computer Science Conference',
              ),
            ),
            new Marker(
              anchorPos: AnchorPos.align(AnchorAlign.top),
              width: 200.0,
              height: 50.0,
              point: new LatLng(51.53, -0.11),
              builder: (ctx) => new ConferenceIcon(
                name: 'Applied Mathematics and Physics',
              ),
            ),
            new Marker(
              anchorPos: AnchorPos.align(AnchorAlign.top),
              width: 200.0,
              height: 50.0,
              point: new LatLng(51.48, -0.08),
              builder: (ctx) => new ConferenceIcon(
                name: 'Robotics and AI',
              ),
            ),
          ],
        ),
      ],
    ),
    SearchConference()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Conf World'), backgroundColor: Colors.green[500]),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Filter Conferences',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
