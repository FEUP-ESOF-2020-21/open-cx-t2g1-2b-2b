import 'package:conf_world/model/conference_model.dart';

import 'database.dart';

class SavedConferencesController {
  List<ConferenceModel> savedConfs;

  SavedConferencesController() {
    DatabaseHelper db = new DatabaseHelper();

    savedConfs = db.getAllSavedConferences();
  }
}