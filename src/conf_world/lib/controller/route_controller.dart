import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/screens/filter_type.dart';
import 'package:conf_world/view/screens/home_page.dart';
import 'package:conf_world/view/screens/navigation.dart';
import 'package:conf_world/view/screens/saved_conferences.dart';

class RouteController { // Ask teacher about this class
  static navigateHomePage(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageState()),
      );
  }

  static navigateWorldMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navigation(filter: 'false')),
    );
  }

  static navigateWorldMapFilter(BuildContext context, String filterBy) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navigation(filter: filterBy)),
    );
  }

  static navigateSavedConference(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SavedConferencesState()),
    );
  }

  static navigateWorldMapSaved(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navigation(filter: 'SAVED')),
    );
  }

  static navigateSavedConferenceDetails(BuildContext context, ConferenceModel conference) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          Navigation(latitude: conference.latitude, longitude: conference.longitude)),
    );
  }

  static navigateWorldMapType(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterByType()),
    );
  }
}
