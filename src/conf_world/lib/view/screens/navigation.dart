
import 'package:conf_world/view/screens/world_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'filter_page.dart';

class Navigation extends StatefulWidget {
  final String filter;
  final double startLatitude;
  final double startLongitude;
  final int buttonToClick;

  const Navigation.startLocation({Key key, this.filter = 'false', this.startLatitude, this.startLongitude, this.buttonToClick}) : super(key: key);

  const Navigation({Key key, this.filter = 'false', this.startLatitude = 51.5, this.startLongitude = -0.09, this.buttonToClick = -1}) : super(key: key);

  @override
  NavigationState createState() => NavigationState(this.filter, this.startLatitude, this.startLongitude, this.buttonToClick);
}

class NavigationState extends State<Navigation> {
  final Color background = Color(0xff5a189a);
  final Color iconNavigation = Color(0xffe0aaff);
  final Color iconActiveNavigation = Color(0xfff3dfff);

  // ^ View
  // -----------
  // ↓ Controller

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // --------

  static List<Widget> _widgetOptions;
  int _selectedIndex = 0;

  NavigationState(String filter, startLatitude, startLongitude, buttonToClick) {
    _widgetOptions = <Widget>[MapRoute(filter: filter, latitude: startLatitude, longitude: startLongitude, buttonToClick: buttonToClick), FilterPage()];
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('World Map'),
          backgroundColor: background
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: iconNavigation
            ),
            activeIcon: Icon(
              Icons.home,
              color: iconActiveNavigation
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: iconNavigation
            ),
            activeIcon: Icon(
              Icons.search,
              color: iconActiveNavigation
            ),
            label: 'Filter Conferences',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: background,
        selectedItemColor: iconActiveNavigation,
        unselectedItemColor: iconNavigation,
        onTap: _onItemTapped,
      ),
    );
  }
}
