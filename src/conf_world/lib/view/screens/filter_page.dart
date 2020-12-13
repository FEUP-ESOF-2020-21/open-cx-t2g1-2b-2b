import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/filter_page_model.dart';
import 'package:conf_world/view/widgets/button.dart';

class FilterPage extends StatelessWidget {
  final FilterConferenceModel model = FilterConferenceModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapType(context),
            child: MyButton(name: model.optionA),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapDate(context),
            child: MyButton(name: model.optionB),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapFilter(context, model.typeC, "null"),
            child: MyButton(name: model.optionC),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapFilter(context, "false", model.typeD),
            child: MyButton(name: model.optionD),
          ),
        ],
      ),
    );
  }
}


