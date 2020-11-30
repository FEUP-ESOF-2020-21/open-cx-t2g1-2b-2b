import 'package:conf_world/model/conference_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ConferenceDetails extends StatelessWidget {
  final ConferenceInfo conference;

  ConferenceDetails({Key key, this.conference}) : super(key: key);

  _updateSaved() {
    conference.saved = !conference.saved;
  }

  _launchURL() async {
    if (await canLaunch(conference.url)) {
      await launch(conference.url);
    } else {
      throw 'Could not launch $conference.url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.green[500],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.green[600],
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Name: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      conference.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.green[1000]),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.green[600],
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Type: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      conference.type,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.green[1000]),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.green[600],
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Saved Conference: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      conference.saved ? "true" : "no",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.green[1000]),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.green[600],
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Submit Papers: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      conference.submitPaper,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.green[1000]),
                    ),
                    Expanded(
                      child: Text(
                        'Date:',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' ' + conference.date,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.green[1000]),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.green[600],
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'URL: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    ElevatedButton(
                      onPressed: _launchURL,
                      child: new Text(
                        conference.url,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.green[600],
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _updateSaved,
                      child: new Text(
                        "Star",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 6,
            child: Container(
                color: Colors.green[600],
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Description: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    Flexible(
                        child: new Text(
                      conference.description,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.green[1000]),
                    )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
