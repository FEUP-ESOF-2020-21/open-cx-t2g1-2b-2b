import 'package:conf_world/controller/conference_controller.dart';

class WorldMapModel {
  ConferenceController controller;

  WorldMapModel(String filter, int buttonToClick) {
    controller = ConferenceController(filter, buttonToClick);
  }

  getMarkers() {
    return controller.getMarkers();
  }
}