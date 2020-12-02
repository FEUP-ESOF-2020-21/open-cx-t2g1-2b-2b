import 'package:conf_world/model/conference_model.dart';

import 'database.dart';

class SavedConferencesController {
  List<ConferenceModel> savedConfs;

  SavedConferencesController() {
    savedConfs = _getSavedConf();
  }

  _getSavedConf() {
    var nSavedConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConfs();

    for (var i = 0; i < allConferences.length; i++) {
      if ((allConferences[i].saved == 1)) {
        nSavedConf.add(allConferences[i]);
      }
    }

    return nSavedConf;
  }
}