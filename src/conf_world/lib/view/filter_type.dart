import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './navigation.dart';
import '../widgets/my_button.dart';

class FilterByType extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FilterByTypeState();
  }
}

class FilterByTypeState extends State<FilterByType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3c096c),
      appBar: AppBar(
        title: Text("Conference Types"),
        centerTitle: true,
        backgroundColor: Color(0xff5a189a),
      ),
      body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Navigation(filter: 'CS')),
                );
              },
              child: MyButton(
                name: 'Computer Science Conferences',
              ),
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Navigation(filter: 'MATH')),
                );
              },
              child: MyButton(
                name: 'Math Conferences',
              ),
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Navigation(filter: 'false')),
                );
              },
              child: MyButton(
                name: 'See world map without filters',
              ),
            ),
          ]
      ),
    );
  }
}