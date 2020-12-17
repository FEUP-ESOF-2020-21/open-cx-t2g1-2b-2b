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

  const Navigation({Key key, this.type, this.filter, this.latitude = 51.52, this.longitude = -0.12, this.savedID = -1}) : super(key: key);

  @override
  NavigationState createState() => NavigationState(this.type, this.filter, this.latitude, this.longitude, this.savedID);
}

class NavigationState extends State<Navigation> {
  List<List<dynamic>> bottomBar =
  [[Icons.home, Color(0xffF4845F), Icons.home, Color(0xffF79D65), 'Map'],
    [Icons.search, Color(0xffF4845F), Icons.search, Color(0xffF79D65), 'Filter Conferences']];

  static List<Widget> _widgetOptions;
  int _selectedIndex = 0;

  NavigationState(String type, dynamic filter, double latitude, double longitude, int savedID) {
    _widgetOptions = <Widget>[MapRoute(type: type, filter: filter, latitude: latitude, longitude: longitude, savedID: savedID), FilterPage()];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('World Map'),
          backgroundColor: Color(0xffF4845F),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for(var info in bottomBar)
            BottomNavigationBarItem(
              icon: Icon(
                info[0],
                color: info[1]
              ),
              activeIcon: Icon(
                  info[2],
                color: info[3]
              ),
              label: info[4],
            ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xFF303030),
        selectedItemColor: Color(0xffF79D65),
        unselectedItemColor: Color(0xffF4845F),
        onTap: _onItemTapped,
      ),
    );
  }
}
