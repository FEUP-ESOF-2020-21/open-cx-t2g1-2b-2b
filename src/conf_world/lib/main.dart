import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:conf_world/view/screens/home_page.dart';

import 'controller/database.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = new DatabaseHelper();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF212121),
    systemNavigationBarDividerColor: Color(0xffF4845F),

    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(MaterialApp(
    home: HomePageState(),
  ));
}

