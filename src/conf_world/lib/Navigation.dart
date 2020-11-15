import 'package:conf_world/SearchConference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'SearchConference.dart';
import 'MapRoute.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[MapRoute(), SearchConference()];

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
            icon: Icon(
                Icons.home,
                color: Colors.lightGreenAccent,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.search,
                color: Colors.lightGreenAccent,
            ),
            label: 'Filter Conferences',
          ),
        ],
        backgroundColor: Colors.grey,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreenAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
