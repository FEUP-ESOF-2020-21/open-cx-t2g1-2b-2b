import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationModel {
  final Color background = Color(0xff5a189a);
  final Color iconNavigation = Color(0xffe0aaff);
  final Color iconActiveNavigation = Color(0xfff3dfff);

  final String appBarText = 'World Map';

  List<List<dynamic>> bottomBar =
    [[Icons.home, Color(0xffe0aaff), Icons.home, Color(0xfff3dfff), 'Map'],
     [Icons.search, Color(0xffe0aaff), Icons.search, Color(0xfff3dfff), 'Filter Conferences']];
}