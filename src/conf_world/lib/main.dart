import 'package:conf_world/database.dart';
import 'package:conf_world/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = new DatabaseHelper();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff5a189a),
    systemNavigationBarDividerColor: Color(0xff5a189a),

    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MaterialApp(
    home: HomePageState(),
  ));
}

