import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import 'home_page.dart';
import './navigation.dart';

class SavedConferencesState extends StatelessWidget {
  List<ConferenceInfo> savedConfs;

  SavedConferencesState() {
    DatabaseHelper db = new DatabaseHelper();

    savedConfs = db.getAllSavedConferences();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3c096c),
        appBar: AppBar(
          title: Text("My Saved Conferences"),
          centerTitle: true,
          backgroundColor: Color(0xff5a189a),
        ),
        body:
        ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: savedConfs.length + 1,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            if (index == savedConfs.length){
              print("hello");
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageState()),
                  );
                },
                child: MyButton(
                  name: 'Back to Main Menu',
                ),
              );
            }

            final item = savedConfs[index];

            return ListTile(
              title: Text(
                item.name,
                style: TextStyle(
                  color: Color(0xffe0aaff),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Navigation.startLocation(filter: 'false', startLatitude: item.latitude, startLongitude: item.longitude, buttonToClick: item.id)),
                );
              },
            );
          },
        ),
    );
  }
}