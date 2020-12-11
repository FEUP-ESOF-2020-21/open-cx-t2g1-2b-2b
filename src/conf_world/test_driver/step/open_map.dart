import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class ThereIsAViewMapButton extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String expectedVal) async {
    final locator = find.text(expectedVal);
    var locatorExists =
    await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp("There is a {String} button");
}

class UserTapsMapButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String expectedVal) async {
    final locator = find.text(expectedVal);
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  RegExp get pattern => RegExp("I tap the {string} button");
}

class OpenWorldMap extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byValueKey('world-map');
    var counterVal  = await FlutterDriverUtils.isPresent(world.driver, locator);

    expectMatch(true, counterVal);
  }

  @override
  RegExp get pattern => RegExp(r"The world map will open");
}

class AllConferences extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
   
    final locator = find.byValueKey("pinpoint");
    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp("I will see all conferences represented by pinpoints");
}
