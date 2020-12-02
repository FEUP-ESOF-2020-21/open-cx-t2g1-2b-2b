import 'package:conf_world/view/screens/world_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'filter_page.dart';

class Navigation extends StatefulWidget {
  final String filter;

  const Navigation({Key key, this.filter = 'false'}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState(this.filter);
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions;

  _NavigationState(String filter) {
    _widgetOptions = <Widget>[MapRoute(filter), FilterPage()];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final Color background = Color(0xff5a189a);
  final Color iconNavigation = Color(0xffe0aaff);
  final Color iconActiveNavigation = Color(0xfff3dfff);

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
