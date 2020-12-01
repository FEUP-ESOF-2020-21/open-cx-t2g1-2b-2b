import 'package:conf_world/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SavedConferencesState extends StatelessWidget {
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
        Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: MyButton(
                  name: '[List here all conferences]',
                ),
              ),
              FlatButton(
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
              ),
            ],
          ),
        ));
  }
}