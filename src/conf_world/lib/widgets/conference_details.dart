import 'package:conf_world/model/conference_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConferenceDetails extends StatelessWidget {
  final ConferenceInfo conference;

  ConferenceDetails({Key key, this.conference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.green[500],
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
              color: Colors.green[600],
              margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
              padding: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  Text(
                    'Name: ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.amber, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    conference.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.green[1000]),
                  ),
                ],
              )),
          new Container(
              color: Colors.green[600],
              margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
              padding: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  Text(
                    'Date: ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.amber, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    conference.date,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.green[1000]),
                  ),
                ],
              )),
          new Container(
              color: Colors.green[600],
              margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
              padding: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  Text(
                    'Description: ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.amber, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    conference.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.green[1000]),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
