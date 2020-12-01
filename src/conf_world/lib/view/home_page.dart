import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/saved_conferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './navigation.dart';
import '../widgets/my_button.dart';

class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3c096c),
        appBar: AppBar(
          title: Text("Conf World"),
          centerTitle: true,
          backgroundColor: Color(0xff5a189a),
        ),
        body:
        Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation(filter: 'false')),
                  );
                },
                child: MyButton(
                  name: 'See World Map',
                ),
              ),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SavedConferencesState()),
                  );
                },
                child: MyButton(
                  name: 'My Saved Conferences',
                ),
              ),
            ],
          ),
        ));
  }
}