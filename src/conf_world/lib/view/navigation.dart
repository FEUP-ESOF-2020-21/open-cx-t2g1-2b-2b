import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'filter_conference.dart';
import 'world_map.dart';

class Navigation extends StatefulWidget {
  final String filter;

  const Navigation({Key key, this.filter = 'false'}) : super(key: key);

  @override
  NavigationState createState() => NavigationState(this.filter);
}

class NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions;

  NavigationState(String filter) {
    _widgetOptions = <Widget>[MapRoute(filter), SearchConference()];
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
          title: new Text('Conf World'), backgroundColor: Colors.green[500]),
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        key: Key('Bottom Navigation Bar'),
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
        currentIndex: selectedIndex,
        selectedItemColor: Colors.lightGreenAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
