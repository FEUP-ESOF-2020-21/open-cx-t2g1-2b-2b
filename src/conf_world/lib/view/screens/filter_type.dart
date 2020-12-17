import 'package:conf_world/controller/filter_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/filter_type_model.dart';
import 'package:conf_world/view/widgets/button.dart';

class FilterByType extends StatelessWidget {
  final FilterTypeModel model = FilterTypeModel();

  FilterByType() {
    FilterTypeController controller = FilterTypeController(model);

    controller.updateConferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: model.backgroundColor,
      appBar: AppBar(
        title: Text(model.appBarName),
        centerTitle: true,
        backgroundColor: model.appBarBackgroundColor,
      ),
      body: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            for(var type in model.types)
              FlatButton(
                key: Key(type),
                padding: EdgeInsets.zero,
                onPressed: () => RouteController.navigateWorldMapFilter(context, "type", type),
                child: MyButton(name: type),
              ),
          ]
      ),
    );
  }
}
