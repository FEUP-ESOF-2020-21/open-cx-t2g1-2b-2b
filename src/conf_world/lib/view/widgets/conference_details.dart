import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/map_conference_controller.dart';
import 'package:conf_world/model/conference_model.dart';

class ConferenceDetails extends StatefulWidget {
  final MapConferenceController controller;
  final ConferenceModel model;

  ConferenceDetails({Key key, this.controller, this.model}) : super(key: key);

  @override
  ConfDetails createState() => ConfDetails(this.model, this.controller);
}

class ConfDetails extends State<ConferenceDetails> {
  final ConferenceModel model;
  MapConferenceController controller;

  ConfDetails(this.model, this.controller);

  Widget function(int flexSize, List<List<dynamic>> dynamicList) {
    List<Widget> list = new List<Widget>();

    for(var i in dynamicList) {
      list.add(Text(
        i[0].toString(),
        textAlign: TextAlign.start,
        style: TextStyle(
            color: model.detailsTextColor,
            fontStyle: FontStyle.italic),
      ));

      list.add(Flexible(
        child: new Text(
        i[1].toString(),
        textAlign: TextAlign.start,
        style: TextStyle(color: model.informationColor),
        ),
      ));
    }

    return Expanded(
            flex: flexSize,
            child: Container(
            color: model.colorForeground,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
            padding: EdgeInsets.all(4),
            child: Row(
              children: list
        )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: model.colorBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          function(1, [['Name: ', model.name]]),
          function(1, [['Type: ', model.type]]),
          function(1, [['Saved Conference: ', model.isSaved()]]),
          function(1, [['Submit Papers: ', model.submitPaper], ['   Date: ', model.date]]),
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
                      onPressed: () => controller.launchURL(model),
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
                      onPressed: () => controller.updateSaved(model, this),
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
          function(6, [['Description: ', model.description]]),
        ],
      ),
    );
  }
}