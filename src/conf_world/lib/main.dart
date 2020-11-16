import 'package:conf_world/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conf World',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Conf World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  //MyHomePageState createState() => MyHomePageState();
}

*/

void main() {
  runApp(MaterialApp(
    home: HomePageState(),
  ));
}

