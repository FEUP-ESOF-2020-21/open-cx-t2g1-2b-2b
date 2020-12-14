import 'package:conf_world/model/screens/filter_type_model.dart';

class FilterTypeController {
  FilterTypeModel model;

  FilterTypeController(FilterTypeModel model) {
    this.model = model;
  }

  updateConferences() {
    model.addType('CS', 'Computer Science Conferences');
    model.addType('MATH', 'Math Conferences');
  }
}