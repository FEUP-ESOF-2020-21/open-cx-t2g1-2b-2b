import 'package:flutter/material.dart';

import '../main.dart'; // Devia estar direito mas não deteta
import '../view/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  runApp(MaterialApp(
    home: HomePageState(),
  ));
}
