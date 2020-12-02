import 'package:conf_world/controller/marker_controller.dart';

class WorldMapModel {
  MarkerController markers;

  WorldMapModel(String filter) {

    markers = MarkerController(filter);
  }

  getMarkers() {
    return markers.markers;
  }
}