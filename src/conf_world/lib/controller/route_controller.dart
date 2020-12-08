import 'package:conf_world/view/screens/filter_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/screens/filter_type.dart';
import 'package:conf_world/view/screens/home_page.dart';
import 'package:conf_world/view/screens/navigation.dart';
import 'package:conf_world/view/screens/saved_conferences.dart';

dynamic lastFilter = 'false';

class RouteController { // Ask teacher about this class
  static navigateHomePage(BuildContext context) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePageState()), (_) => false
      );
  }

  static navigateWorldMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Navigation(type: 'false', filter: lastFilter)),
    );
  }

  static navigateWorldMapFilter(BuildContext context, String type, dynamic filterBy) {
    lastFilter = filterBy;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Navigation(type: type, filter: filterBy)),
    );
  }


  static navigateSavedConference(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SavedConferencesState()),
    );
  }

  static navigateSavedConferenceDetails(BuildContext context, ConferenceModel conference) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>
          Navigation(latitude: conference.latitude, longitude: conference.longitude)),
    );
  }

  static navigateWorldMapType(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FilterByType()),
    );
  }

  static navigateWorldMapDate(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FilterByDate()),
    );
  }
}
