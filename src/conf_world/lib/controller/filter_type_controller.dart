import 'database.dart';

class FilterTypeController {
  List<String> types = [];
  DatabaseHelper database;

  FilterTypeController() {
    this.database = new DatabaseHelper();
  }

  updateConferences() {
    this.types = database.getConferenceType();
  }
}