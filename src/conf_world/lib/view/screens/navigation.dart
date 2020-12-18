import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/view/screens/world_map.dart';
import 'package:conf_world/view/screens/filter_page.dart';

class Navigation extends StatefulWidget {
  final String type;
  final dynamic filter;
  final double latitude;
  final double longitude;
  final int savedID;

  const Navigation(
      {Key key,
      this.type,
      this.filter,
      this.latitude = 51.52,
      this.longitude = -0.12,
      this.savedID = -1})
      : super(key: key);

  @override
  NavigationState createState() => NavigationState(
      this.type, this.filter, this.latitude, this.longitude, this.savedID);
}

class NavigationState extends State<Navigation> {
  static List<Widget> _widgetOptions;
  int selectedIndex = 0;

  NavigationState(String type, dynamic filter, double latitude,
      double longitude, int savedID) {
    _widgetOptions = <Widget>[
      MapRoute(
          type: type,
          filter: filter,
          latitude: latitude,
          longitude: longitude,
          savedID: savedID),
      FilterPage()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('World Map'),
        backgroundColor: Color(0xffF4845F),
      ),
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xffF4845F)),
            activeIcon: Icon(Icons.home, color: Color(0xffF79D65)),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xffF4845F)),
            activeIcon: Icon(Icons.search, color: Color(0xffF79D65)),
            label: 'Filter Conferences',
          ),
        ],
        currentIndex: selectedIndex,
        backgroundColor: Color(0xFF303030),
        selectedItemColor: Color(0xffF79D65),
        unselectedItemColor: Color(0xffF4845F),
        onTap: _onItemTapped,
      ),
    );
  }
}
