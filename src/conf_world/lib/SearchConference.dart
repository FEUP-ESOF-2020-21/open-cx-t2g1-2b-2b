import 'package:conf_world/main.dart';
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

class FilterByType extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FIlterByTypeState();
  }
}

class FIlterByTypeState extends State<FilterByType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container (
            child: Text(
              'Conferences Types',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.green.shade200,
            ),
            margin: EdgeInsets.fromLTRB(40, 40, 40, 15),
            height: 450,
          ),
          Container(
            color: Colors.blue,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container (
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchConference()),
                      );
                    },
                    child: Text('Filter Conferences',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    height: 50,
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                ),
                Container (
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageState()),
                      );
                    },
                    child: Text('Back to Main Menu',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    height: 50,
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
