import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/view/widgets/button.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF303030),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapType(context),
            child: MyButton(name: 'Filter by Type'),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapDate(context),
            child: MyButton(name: 'Filter by Date'),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapFilter(
                context, 'saved', "null"),
            child: MyButton(name: 'Saved Conferences'),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapFilter(
                context, "false", 'false'),
            child: MyButton(name: 'Without Filters'),
          ),
        ],
      ),
    );
  }
}
