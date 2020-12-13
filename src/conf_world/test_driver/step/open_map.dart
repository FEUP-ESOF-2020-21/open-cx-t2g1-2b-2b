import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class ThereIsButton extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String expectedVal) async {
    final locator = find.text(expectedVal);
    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp("There is a {String} button");
}

class OpenMap extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byValueKey('world-map');

    var counterVal  = await FlutterDriverUtils.isPresent(world.driver, locator);

    expectMatch(true, counterVal);
  }

  @override
  RegExp get pattern => RegExp("The world map will open");
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
