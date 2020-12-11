import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class ThereIsAViewMapButton extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String expectedVal) async {
    final locator = find.text("See World Map");

    var locatorExists =
        await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(expectedVal, locatorExists);
  }

  @override
  RegExp get pattern => RegExp("There is a {String} button");
}
