import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'filter_conference.dart';
import 'world_map.dart';

class Navigation extends StatefulWidget {
  final String filter;

  const Navigation({Key key, this.filter = 'false'}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState(this.filter);
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions;

  _NavigationState(String filter) {
    _widgetOptions = <Widget>[MapRoute(filter), SearchConference()];
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
          backgroundColor: Color(0xff5a189a)
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xffe0aaff),
            ),
            activeIcon: Icon(
              Icons.home,
              color: Color(0xfff3dfff),
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color(0xffe0aaff),
            ),
            activeIcon: Icon(
              Icons.search,
              color: Color(0xfff3dfff),
            ),
            label: 'Filter Conferences',
          ),
        ],
        backgroundColor: Color(0xff5a189a),
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xfff3dfff),
        unselectedItemColor: Color(0xffe0aaff),
        onTap: _onItemTapped,
      ),
    );
  }
}
