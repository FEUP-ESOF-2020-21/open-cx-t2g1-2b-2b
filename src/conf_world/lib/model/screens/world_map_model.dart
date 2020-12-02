import 'package:conf_world/controller/conference_controller.dart';

class WorldMapModel {
  ConferenceController controller;

  WorldMapModel(String filter) {
    controller = ConferenceController(filter);
  }

  getMarkers() {
    return controller.getMarkers();
  }
}