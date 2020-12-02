import 'package:conf_world/view/screens/filter_type.dart';
import 'package:conf_world/view/screens/navigation.dart';
import 'package:conf_world/view/screens/saved_conferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteController {

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

  static navigateWorldMapType(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterByType()),
    );
  }
}
