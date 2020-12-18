import 'package:conf_world/controller/database.dart';
import 'package:conf_world/view/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the main() function of your app or call runApp with any widget you
  // are interested in testing.
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = new DatabaseHelper();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF212121),
    systemNavigationBarDividerColor: Color(0xffF4845F),

    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MaterialApp(
    home: HomePageState(),
  ));
}
