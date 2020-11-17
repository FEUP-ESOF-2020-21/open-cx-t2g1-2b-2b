import 'dart:convert';

import 'package:flutter/services.dart';

import 'model/marker_model.dart';
import 'model/conference_model.dart';

class Database {
  ConferenceMarker markerList;
  var conferences = <ConferenceInfo>[];

  static final Database _singleton = Database._internal();

  factory Database() {
    return _singleton;
  }

  Database._internal() {
    _loadDb();
  }

  Future<String>_loadFromAsset() async {
    return await rootBundle.loadString("assets/conferences.json");
  }

  void _loadDb() async {
    String rd = await _loadFromAsset();

    List<dynamic> userMap = jsonDecode(rd);

    for(var i = 0; i < userMap.length; i++) {
      this.conferences.add(ConferenceInfo.fromJson(userMap[i]));
    }

    updateMarkers('false');
  }

  updateMarkers(String filter) {
    this.markerList = new ConferenceMarker(this.conferences, filter);
  }
}