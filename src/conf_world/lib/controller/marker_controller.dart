import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/model/marker_model.dart';
import 'package:flutter_map/flutter_map.dart';

import 'database.dart';

class MarkerController {
  var markers = <Marker>[];

  var conferences;

  final String filter;

  MarkerController(this.filter) {
    this.conferences = getFilterConf(this.filter);

    _initMarkers();
  }

  void _initMarkers() {
    for(var conferenceD in conferences) {
      MarkerModel n = new MarkerModel(conferenceD);

      this.markers.add(n.getMarker());
    }
  }

  getFilterConf(String filter) {
    DatabaseHelper dh = new DatabaseHelper();
    var cf = dh.getAllConfs();

    var nFilterConf = <ConferenceModel>[];

    for(var conferenceD in cf) {
      if((filter == conferenceD.type) || (filter == 'false') || ((filter == 'SAVED') && (conferenceD.saved == 1))) {
        nFilterConf.add(conferenceD);
      }
    }
    return nFilterConf;
  }
}