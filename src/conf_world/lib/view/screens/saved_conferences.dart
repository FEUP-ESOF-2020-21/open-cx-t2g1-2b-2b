import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/controller/saved_conferences_controller.dart';
import 'package:conf_world/model/screens/saved_conferences_model.dart';
import 'package:conf_world/view/widgets/button.dart';

class SavedConferencesState extends StatelessWidget {
  final SavedConferencesController controller = SavedConferencesController();
  final SavedConferencesModel model = SavedConferencesModel();

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
          itemCount: controller.savedConferences.length + 1,

          itemBuilder: (context, index) {
            if (index == controller.savedConferences.length) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () => RouteController.navigateHomePage(context),
                child: MyButton(name: model.backButton),
              );
            }

            final item = controller.savedConferences[index];
            return ListTile(
              title: Text(
                item.name,
                style: TextStyle(color: model.textColor),
              ),
              trailing: GestureDetector(
              onTap: () =>  RouteController.navigateSavedConferenceDetails(context, item),
                child: new Container(
                  alignment: Alignment.center,
                  child: Text(
                    model.boxConferenceText,
                    style: TextStyle(fontSize: 14, color: model.textColor),
                    textAlign: TextAlign.center,
                  ),
                  constraints: BoxConstraints.expand(width: 140, height: 45),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: model.boxColor,
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}