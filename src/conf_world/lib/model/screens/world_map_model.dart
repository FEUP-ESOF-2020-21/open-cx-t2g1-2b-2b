import 'package:conf_world/controller/conference_controller.dart';

class WorldMapModel {
  ConferenceController markers;

  WorldMapModel(String filter) {

    markers = ConferenceController(filter);
  }

  getMarkers() {
    return markers.markers;
  }
}