import 'package:conf_world/controller/database.dart';
import 'package:conf_world/model/conference_model.dart';

class SavedConferencesController {
  List<ConferenceModel> savedConferences;

  SavedConferencesController() {
    savedConferences = _getSavedConf();
  }

  _getSavedConf() {
    var nSavedConf = <ConferenceModel>[];

    DatabaseHelper database = new DatabaseHelper();
    var allConferences = database.getAllConferences();

    for (var i = 0; i < allConferences.length; i++) {
      if ((allConferences[i].saved == 1)) {
        nSavedConf.add(allConferences[i]);
      }
    }

    return nSavedConf;
  }
}