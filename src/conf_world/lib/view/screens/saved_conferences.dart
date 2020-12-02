import 'package:conf_world/controller/database.dart';
import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/model/screens/saved_conferences_model.dart';
import 'package:conf_world/view/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SavedConferencesState extends StatelessWidget {
  SavedConferencesModel model = SavedConferencesModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: model.backgroundColor,
        appBar: AppBar(
          title: Text(model.appBarText),
          centerTitle: true,
          backgroundColor: model.appBarColor,
        ),
        body:
        ListView.builder(
          itemCount: model.savedConfs.length + 1,

          itemBuilder: (context, index) {
            if (index == model.savedConfs.length) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () => RouteController.navigateHomePage(context),
                child: MyButton(name: model.backButton),
              );
            }

            final item = model.savedConfs[index];
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