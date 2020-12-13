import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class UserTapsButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String expectedVal) async {
    final locator = find.text(expectedVal);
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  RegExp get pattern => RegExp("I tap the {string} button");
}