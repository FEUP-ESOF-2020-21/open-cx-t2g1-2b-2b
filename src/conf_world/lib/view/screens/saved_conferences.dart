import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/controller/saved_conferences_controller.dart';

class SavedConferencesState extends StatelessWidget {
  final SavedConferencesController controller = SavedConferencesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      appBar: AppBar(
        title: Text("My Saved Conferences"),
        centerTitle: true,
        backgroundColor: Color(0xffF4845F),
      ),
      body: ListView.builder(
        itemCount: controller.savedConferences.length,
        itemBuilder: (context, index) {
          final item = controller.savedConferences[index];
          return ListTile(
            title: Text(
              item.name,
              style: TextStyle(color: Color(0xffF4845F)),
            ),
            trailing: GestureDetector(
              onTap: () =>
                  RouteController.navigateSavedConferenceDetails(context, item),
              child: new Container(
                alignment: Alignment.center,
                child: Text(
                  'Go to World Map',
                  style: TextStyle(fontSize: 14, color: Color(0xffF4845F)),
                  textAlign: TextAlign.center,
                ),
                constraints: BoxConstraints.expand(width: 140, height: 45),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xff212121),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
