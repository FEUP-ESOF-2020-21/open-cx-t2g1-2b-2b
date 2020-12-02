import 'package:conf_world/model/conference_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConferenceDetails extends StatefulWidget {
  final ConferenceModel conference;

  ConferenceDetails({Key key, this.conference}) : super(key: key);

  @override
  ConfDetails createState() => ConfDetails(this.conference);
}

class ConfDetails extends State<ConferenceDetails> {
  final ConferenceModel model;

  ConfDetails(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: model.colorBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: model.colorForeground,
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Name: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: model.detailsTextColor, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      model.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: model.informationColor),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: model.colorForeground,
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Type: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: model.detailsTextColor, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      model.type,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: model.informationColor),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: model.colorForeground,
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Saved Conference: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: model.detailsTextColor, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      model.isSaved(),
                      textAlign: TextAlign.start,
                      style: TextStyle(color: model.informationColor),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: model.colorForeground,
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Submit Papers: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: model.detailsTextColor, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      model.submitPaper,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: model.informationColor),
                    ),
                    Expanded(
                      child: Text(
                        'Date:',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: model.detailsTextColor, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' ' + model.date,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: model.informationColor),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: model.colorForeground,
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'URL: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: model.detailsTextColor, fontStyle: FontStyle.italic),
                    ),
                    ElevatedButton(
                      onPressed: model.launchURL,
                      style: new ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) { return model.colorBackground; }),
                      ),
                      child: new Text(
                        model.url,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: model.detailsTextColor, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: model.colorForeground,
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => model.updateSaved(this),
                      style: new ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) { return model.colorBackground; }),
                      ),
                      child: new Text(
                        "Star",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: model.detailsTextColor, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 6,
            child: Container(
                color: model.colorForeground,
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                padding: EdgeInsets.all(4),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Description: ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: model.detailsTextColor, fontStyle: FontStyle.italic),
                    ),
                    Flexible(
                        child: new Text(
                          model.description,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: model.informationColor),
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}