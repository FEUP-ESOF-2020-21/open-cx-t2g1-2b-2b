import 'file:///C:/Users/diogo/Documents/GitHub/open-cx-t2g1-2b-2b/src/conf_world/lib/model/my_button.dart';
import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/filter_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterByType extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FilterByTypeState();
  }
}

class FilterByTypeState extends State<FilterByType> {
  final FilterTypeModel model = FilterTypeModel();

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
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () => RouteController.navigateWorldMapFilter(context, model.type1),
              child: MyButton(
                name: model.type1Name,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () => RouteController.navigateWorldMapFilter(context, model.type2),
              child: MyButton(
                name: model.type2Name,
              ),
            ),
          ]
      ),
    );
  }
}