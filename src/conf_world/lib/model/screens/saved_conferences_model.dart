import 'dart:ui';

import 'package:conf_world/controller/saved_conferences_controller.dart';

import '../conference_model.dart';

class SavedConferencesModel {
  SavedConferencesController controller = SavedConferencesController();

  List<ConferenceModel> savedConfs;

  final Color backgroundColor = Color(0xFF3c096c);
  final String appBarText = "My Saved Conferences";
  final Color appBarColor = Color(0xff5a189a);

  final String backButton = 'Back to Confi World';

  SavedConferencesModel() {
    savedConfs = controller.savedConfs;
  }
}

