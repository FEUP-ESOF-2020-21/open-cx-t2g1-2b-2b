import 'package:conf_world/controller/route_controller.dart';
import 'file:///C:/Users/diogo/Documents/GitHub/open-cx-t2g1-2b-2b/src/conf_world/lib/model/screens/filter_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../model/my_button.dart';

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
            onPressed: null,
            child: MyButton(name: model.optionB),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapSaved(context),
            child: MyButton(name: model.optionC),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMap(context),
            child: MyButton(name: model.optionD),
          ),
        ],
      ),
    );
  }
}


