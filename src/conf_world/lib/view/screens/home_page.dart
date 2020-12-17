import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/view/widgets/button.dart';

class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF303030),
        appBar: AppBar(
          title: Text('Conf World'),
          shadowColor: Color(0xffF4845F),
          centerTitle: true,
          backgroundColor: Color(0xffF4845F),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.32,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.22,
                  child: Image(image: AssetImage('assets/img/logo.png'))),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () => RouteController.navigateWorldMap(context),
                child: MyButton(name: 'See World Map'),
              ),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () =>
                    RouteController.navigateSavedConference(context),
                child: MyButton(name: 'My Saved Conferences'),
              ),
            ],
          ),
        ));
  }
}
