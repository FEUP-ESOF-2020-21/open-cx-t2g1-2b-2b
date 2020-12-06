import 'package:conf_world/model/screens/filter_date_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FilterByDate extends StatelessWidget {
  final FilterDateModel model = FilterDateModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: model.backgroundColor,
        appBar: AppBar(
          title: Text("Filter By Date"),
          centerTitle: true,
          backgroundColor: model.appBarBackgroundColor,
        ),
    );
  }
}