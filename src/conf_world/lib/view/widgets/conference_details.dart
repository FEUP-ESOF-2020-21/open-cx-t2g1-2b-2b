import 'package:conf_world/controller/conference_controller.dart';
import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/screens/world_map.dart';
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
  final ConferenceController controller = new ConferenceController('false', -1);
  final ConferenceModel model;

  ConfDetails(this.model);

  Widget testW(int sizeT, String nameT, dynamic field) {
    return Expanded(
      flex: sizeT,
      child: Container(
          color: model.colorForeground,
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          padding: EdgeInsets.all(4),
          child: Row(
            children: <Widget>[
              Text(
                nameT,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: model.detailsTextColor, fontStyle: FontStyle.italic),
              ),
              Flexible(
                child: new Text(
                  field,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: model.informationColor),
                ),
              ),
            ],
          )),
    );
  }

  Widget testD(int sizeT, String nameT1, dynamic field1, String nameT2, dynamic field2) {
    return Expanded(
      flex: sizeT,
      child: Container(
          color: model.colorForeground,
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          padding: EdgeInsets.all(4),
          child: Row(
            children: <Widget>[
              Text(
                nameT1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: model.detailsTextColor, fontStyle: FontStyle.italic),
              ),
              Text(
                field1,
                textAlign: TextAlign.start,
                style: TextStyle(color: model.informationColor),
              ),
              Expanded(
                child: Text(
                  nameT2,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: model.detailsTextColor, fontStyle: FontStyle.italic),
                ),
              ),
              Expanded(
                child: Text(
                  field2,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: model.informationColor),
                ),
              ),
            ],
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
          testW(1, 'Name: ', model.name),
          testW(1, 'Type: ', model.type),
          testW(1, 'Saved Conference: ', model.isSaved()),
          testD(1, 'Submit Papers: ', model.submitPaper, 'Date: ', model.date),
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
          testW(6, 'Description: ', model.description),
        ],
      ),
    );
  }
}