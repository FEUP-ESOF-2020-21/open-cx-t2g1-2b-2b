import 'package:conf_world/ConferenceDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConferenceIcon extends StatelessWidget {
  ConferenceIcon({Key key, this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: [
          new Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.location_pin),
              color: Colors.lightGreen,
              iconSize: 40.0,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return ConferenceDetails(
                        name: name,
                        date: "date",
                        description: "description",
                      );
                    },
                );
              },
            ),
          ),
        new Container(
          alignment: Alignment.center,
          child: Text(
            this.name,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.all(5),
          constraints: BoxConstraints.expand(width: 200, height: 45),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.lightGreen,
          ),

          transform: Matrix4.translationValues(0.0, -45.0, 0),
        ),
      ]
    );
  }
}
