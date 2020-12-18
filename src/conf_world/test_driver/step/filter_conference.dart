import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class FilterMenu extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.text("See World Map");
    final locator1 = find.text('Filter Conferences');

    await FlutterDriverUtils.tap(world.driver, locator);
    await FlutterDriverUtils.tap(world.driver, locator1);
  }

  @override
  RegExp get pattern => RegExp("I am on the Filtering Menu");
}

class SelectConferenceType extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byValueKey('Material Engineering');

    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  RegExp get pattern => RegExp("I select a conference type");
}

class WorldMapType extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byValueKey('Material Engineering');
    final locator1 = find.byValueKey('General topics about Computer Science');
    final locator2 = find.byValueKey('Robotics');
    final locator3 = find.byValueKey('Education');
    final locator4 = find.byValueKey('Artificial Intelligence');

    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);
    var locatorExists1 = await FlutterDriverUtils.isPresent(world.driver, locator1);
    var locatorExists2 = await FlutterDriverUtils.isPresent(world.driver, locator2);
    var locatorExists3 = await FlutterDriverUtils.isPresent(world.driver, locator3);
    var locatorExists4 = await FlutterDriverUtils.isPresent(world.driver, locator4);


    expectMatch(true, locatorExists);
    expectMatch(false, locatorExists1);
    expectMatch(false, locatorExists2);
    expectMatch(false, locatorExists3);
    expectMatch(false, locatorExists4);
  }

  @override
  RegExp get pattern => RegExp("The world map will only show pinpoints with conferences regarding the selected type");
}

class SelectConference extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byTooltip('conference-id=108');

    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);
    await FlutterDriverUtils.tap(world.driver, locator);

    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp("I will be able to select the conference");
}
