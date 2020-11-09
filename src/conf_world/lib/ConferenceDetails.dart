import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConferenceDetails extends StatelessWidget {
  ConferenceDetails({Key key, this.name, this.date, this.description}) : super(key: key);

  final String name;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: [
          new Container(
            color: Colors.lightGreen,
            child: new Center(
              child: new Text(
                  this.name,
                  textAlign: TextAlign.start,
              ),
            ),
          ),
          new Container(
            color: Colors.white,
            child:  new Text(
                  this.date,
                  textAlign: TextAlign.center,
            ),
          ),
          new Container(
            color: Colors.white,
            child: new Text(this.description),
          ),
        ],
      );
  }
}