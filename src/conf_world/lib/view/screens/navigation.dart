import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/model/screens/navigation_model.dart';
import 'package:conf_world/view/screens/world_map.dart';
import 'package:conf_world/view/screens/filter_page.dart';

class Navigation extends StatefulWidget {
  final String type;
  final dynamic filter;
  final double latitude;
  final double longitude;

  const Navigation({Key key, this.type, this.filter, this.latitude = 51.5, this.longitude = -0.09}) : super(key: key);

  @override
  NavigationState createState() => NavigationState(this.type, this.filter, this.latitude, this.longitude);
}

class NavigationState extends State<Navigation> {
  final NavigationModel model = new NavigationModel();
  static List<Widget> _widgetOptions;
  int _selectedIndex = 0;

  NavigationState(String type, dynamic filter, double latitude, double longitude) {
    _widgetOptions = <Widget>[MapRoute(type: type, filter: filter, latitude: latitude, longitude: longitude), FilterPage()];
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
          title: new Text(model.appBarText),
          backgroundColor: model.appBarColor,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for(var info in model.bottomBar)
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
        backgroundColor: model.background,
        selectedItemColor: model.iconActiveNavigation,
        unselectedItemColor: model.iconNavigation,
        onTap: _onItemTapped,
      ),
    );
  }
}
