import 'package:conf_world/controller/world_map_controller.dart';

class WorldMapModel {
  WorldMapController controller;

  WorldMapModel(String filter) {
    this.controller = WorldMapController(filter);
  }

  getMarkers() {
    return controller.getMarkers();
  }
}