import 'package:conf_world/model/marker_model.dart';
import 'package:flutter_map/flutter_map.dart';

import 'database.dart';

class MarkerList {
  var markers = <Marker>[];

  var conferences;

  final String filter;

  MarkerList(this.conferences, this.filter) {
    DatabaseHelper dh = new DatabaseHelper();
    this.conferences = dh.getFilterConf(this.filter);

    _initMarkers();
  }

  void _initMarkers() {
    for(var conferenceD in conferences) {
      MarkerModel n = new MarkerModel(conferenceD);

      this.markers.add(n.getMarker());
    }
  }
}