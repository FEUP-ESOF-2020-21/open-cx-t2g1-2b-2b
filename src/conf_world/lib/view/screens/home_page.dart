import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/home_page_model.dart';
import 'package:conf_world/view/widgets/button.dart';

class HomePageState extends StatelessWidget {
  final HomePageModel model = HomePageModel();

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
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.31,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.15,
                  child: Image(image: AssetImage('assets/img/logo.png'))),
              SizedBox(
                height: 50,
              ),
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
