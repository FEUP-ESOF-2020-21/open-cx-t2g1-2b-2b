import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'step/conference_details.dart';
import 'step/filter_conference.dart';
import 'step/open_map.dart';
import 'step/tap_button.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..hooks = []
    ..stepDefinitions = [
      ThereIsButton(), OpenMap(), AllConferences(), // Open Map
      PinpointScreen(), TapPinpoint(), ConferenceDetails(), // Conference Details
      FilterMenu(), SelectConferenceType(), WorldMapType(), SelectConference(), // Filter Conferences
      UserTapsButton(), // General Steps
  ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
