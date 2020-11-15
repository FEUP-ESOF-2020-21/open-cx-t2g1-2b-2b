import 'package:conf_world/main.dart';
import 'package:conf_world/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MyButton.dart';

class SearchConference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterByType()),
              );
            },
            child: MyButton(
              name: 'Type',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: MyButton(
              name: 'Date',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: MyButton(
              name: 'SaveConferences',
            ),
          ),
        ],
      ),
    );
  }
}

// -- Filter by Type -- //
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
      appBar: AppBar(
        title: Text("Conference Types"),
        centerTitle: true,
        backgroundColor: Colors.green[500],
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
                MaterialPageRoute(builder: (context) => Navigation()),
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
                MaterialPageRoute(builder: (context) => Navigation()),
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
                MaterialPageRoute(builder: (context) => Navigation()),
              );
            },
            child: MyButton(
              name: 'See World Map',
            ),
          ),
        ]
      ),
    );
  }
}
