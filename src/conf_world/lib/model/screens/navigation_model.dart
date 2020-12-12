import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationModel {
  final Color background = Color(0xFF303030);
  final Color iconNavigation = Color(0xffF4845F);
  final Color iconActiveNavigation = Color(0xffF79D65);

  final String appBarText = 'World Map';
  final Color appBarColor = Color(0xffF4845F);

  List<List<dynamic>> bottomBar =
    [[Icons.home, Color(0xffF4845F), Icons.home, Color(0xffF79D65), 'Map'],
     [Icons.search, Color(0xffF4845F), Icons.search, Color(0xffF79D65), 'Filter Conferences']];
}