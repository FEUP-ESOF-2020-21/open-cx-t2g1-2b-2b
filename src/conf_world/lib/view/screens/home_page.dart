import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/home_page_model.dart';
import 'package:conf_world/view/widgets/button.dart';

class HomePageState extends StatelessWidget {
  final HomePageModel model = HomePageModel();

  Widget buildImage(BuildContext context) {
    return Image(image: AssetImage('assets/img/icon.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: model.backgroundColor,
        appBar: AppBar(
          title: Text(model.appBarText),
          shadowColor: Color(0xffF4845F),
          centerTitle: true,
          backgroundColor: model.appBarBackgroundColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: buildImage(context)),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () => RouteController.navigateWorldMap(context),
                child: MyButton(name: model.optionA),
              ),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () =>
                    RouteController.navigateSavedConference(context),
                child: MyButton(name: model.optionB),
              ),
            ],
          ),
        ));
  }
}
