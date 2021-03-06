import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:conf_world/controller/database.dart';
import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/screens/world_map.dart';
import 'package:conf_world/view/widgets/conference_details.dart';
import 'package:conf_world/view/widgets/marker_view.dart';

class MapConferenceController {
  MapRouteState view;
  List<ConferenceModel> conferences;

  MapConferenceController(this.view, String type, dynamic filter) {
    conferences = _initConf(type, filter);
  }

  _initConf(String type, dynamic filter) {
    if(type == 'type') {
      return getAllConfType(filter);
    }
    else if (type == 'saved') {
      return getAllConfSaved();
    }
    else if(type == 'date') {
      return getAllConfDate(filter);
    }
    else if (type == 'false') {
      return getAllConf();
    }
  }

  getAllConfType(String filter) {
    var nFilterConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConferences();

    for(var conferenceD in allConferences) {
      if(filter == conferenceD.type) {
        nFilterConf.add(conferenceD);
      }
    }

    return nFilterConf;
  }

  getAllConfSaved() {
    var nFilterConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConferences();

    for(var conferenceD in allConferences) {
      if(conferenceD.saved == 1) {
        nFilterConf.add(conferenceD);
      }
    }

    return nFilterConf;
  }

  getAllConfDate(DateTimeRange date) {
    var nFilterConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConferences();

    for(var conferenceD in allConferences) {
      if (date.start.isBefore(DateTime.parse(conferenceD.submitPaper)) || date.start.isAtSameMomentAs(DateTime.parse(conferenceD.submitPaper))) {
        if (date.end.isAfter(DateTime.parse(conferenceD.date)) || date.end.isAtSameMomentAs(DateTime.parse(conferenceD.date))) {
          nFilterConf.add(conferenceD);
        }
      }
    }

    return nFilterConf;
  }

  getAllConf() {
    var nFilterConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConferences();

    for(var conferenceD in allConferences) {
      nFilterConf.add(conferenceD);
    }

    return nFilterConf;
  }

  getMarkers() {
    var markers = <Marker>[];

    for(var conferenceD in conferences) {
      markers.add(MarkerView.createMarker(this, conferenceD));
    }

    return markers;
  }

  showModal(BuildContext context, int id) {
    ConferenceModel conference;

    for(var conferenceD in conferences) {
      if(conferenceD.id == id) conference = conferenceD;
    }
    if (conference != null) {
      showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ConferenceDetails(
            controller: this,
            model: conference,
          );
        },
      );
    }
  }

  updateSaved(conference, widget) async {
    conference.saved = (conference.saved + 1) % 2;

    DatabaseHelper db = new DatabaseHelper();

    await db.updateSaved(conference);

    widget.setState(() {}); // Update menu

    this.view.updateMap();
  }

  launchURL(conference) async {
    if (await canLaunch(conference.url)) {
      await launch(conference.url);
    } else {
      throw 'Could not launch url';
    }
  }
}