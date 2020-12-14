import 'package:conf_world/model/screens/filter_type_model.dart';

import 'database.dart';

class FilterTypeController {
  FilterTypeModel model;
  DatabaseHelper database;

  FilterTypeController(FilterTypeModel model) {
    this.model = model;

    this.database = new DatabaseHelper();
  }

  updateConferences() {
    List<String> types = database.getConferenceType();

    model.setType(types);
  }
}