import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class PinpointScreen extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.text("See World Map");
    await FlutterDriverUtils.tap(world.driver, locator);

    final pinpointLocator = find.byValueKey("pinpoint");
    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, pinpointLocator);

    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp("I have the conference pinpoint on my screen");
}

class TapPinpoint extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byTooltip('conference-id=1');

    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(true, locatorExists);

    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  RegExp get pattern => RegExp("I tap a conference's pinpoint");
}

class ConferenceDetails extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byValueKey('conference-details');
    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);

    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp("I will be able to see all the information about it");
}
