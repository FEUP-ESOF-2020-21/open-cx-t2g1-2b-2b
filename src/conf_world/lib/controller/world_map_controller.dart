import 'database.dart';

class WorldMapController {
  DatabaseHelper db;
  final String filter;

  WorldMapController(this.filter) {
    this.db = new DatabaseHelper();

    this.db.updateMarkers(this.filter);
  }

  getMarkers() {
    return this.db.markerList.markers;
  }
}