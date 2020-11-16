import 'model/marker_model.dart';
import 'model/conference_model.dart';

class Database {
  ConferenceMarker markerList;
  var conferences = <ConferenceInfo>[];

  final String filter;

  Database([this.filter = 'false']) {
    this.conferences = <ConferenceInfo>[
      new ConferenceInfo('Computer Science Conference', 'CS', 'date', 'description', 51.5, -0.09),
      new ConferenceInfo('Applied Mathematics and Physics', 'MATH', 'date', 'description', 51.53, -0.11),
      new ConferenceInfo('Robotics and AI', 'CS', 'date', 'description', 51.48, -0.08),
    ];

    this.markerList = new ConferenceMarker(this.conferences, this.filter);
  }
}