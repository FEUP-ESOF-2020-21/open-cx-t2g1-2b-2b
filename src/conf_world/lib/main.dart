import 'package:conf_world/database.dart';
import 'package:conf_world/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = new DatabaseHelper();
  runApp(MaterialApp(
    home: HomePageState(),
  ));
}

