import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/model/marker_model.dart';
import 'package:flutter_map/flutter_map.dart';

import 'database.dart';

class ConferenceController {
  var conferences;

  ConferenceController(String filter) {
    conferences = getFilterConf(filter);
  }

  getMarkers() {
    var markers = <Marker>[];

    for(var conferenceD in conferences) {
      MarkerModel n = new MarkerModel(conferenceD);

      markers.add(n.getMarker());
    }

    return markers;
  }

  getFilterConf(String filter) {
    var nFilterConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConfs();

    for(var conferenceD in allConferences) {
      if((filter == conferenceD.type) || (filter == 'false') || ((filter == 'SAVED') && (conferenceD.saved == 1))) {
        nFilterConf.add(conferenceD);
      }
    }

    return nFilterConf;
  }

  getSavedConf() {
    var nSavedConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConfs();

    for (var i = 0; i < allConferences.length; i++) {
      if((allConferences[i].saved == 1)) {
        nSavedConf.add(allConferences[i]);
      }
    }

    return nSavedConf;
  }

  updateSaved(conference, widget) async {
    conference.saved = (conference.saved + 1) % 2;

    DatabaseHelper db = new DatabaseHelper();

    await db.updateSaved(conference);

    widget.setState(() {}); // Update menu
  }
}