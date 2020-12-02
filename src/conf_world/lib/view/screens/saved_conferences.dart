import 'package:conf_world/controller/database.dart';
import 'package:conf_world/model/conference_model.dart';
import 'file:///C:/Users/diogo/Documents/GitHub/open-cx-t2g1-2b-2b/src/conf_world/lib/model/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SavedConferencesState extends StatelessWidget {
  List<ConferenceModel> savedConfs;

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
          itemCount: savedConfs.length + 1,

          itemBuilder: (context, index) {
            if (index == savedConfs.length){
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageState()),
                  );
                },
                child: MyButton(
                  name: 'Back to Confi World',
                ),
              );
            }

            final item = savedConfs[index];

            return ListTile(
              title: Text(
                item.name,
              ),
            );
          },
        ),
    );
  }
}