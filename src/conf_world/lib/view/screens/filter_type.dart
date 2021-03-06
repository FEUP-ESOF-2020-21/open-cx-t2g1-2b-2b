import 'package:conf_world/controller/filter_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/view/widgets/button.dart';

class FilterByType extends StatelessWidget {
  final FilterTypeController controller = FilterTypeController();

  FilterByType() {
    controller.updateConferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      appBar: AppBar(
        title: Text('Conference Types'),
        centerTitle: true,
        backgroundColor: Color(0xffF4845F),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (var type in controller.types)
              FlatButton(
                key: Key(type),
                padding: EdgeInsets.zero,
                onPressed: () => RouteController.navigateWorldMapFilter(
                    context, "type", type),
                child: MyButton(name: type),
              ),
          ]),
    );
  }
}
