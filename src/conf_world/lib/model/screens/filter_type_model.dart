import 'dart:ui';

class FilterTypeModel {
  final Color backgroundColor = Color(0xFF303030);

  final String appBarName = 'Conference Types';
  final Color appBarBackgroundColor = Color(0xffF4845F);

  List<List<String>> types = [];

  addType(String type, String name) {
    types.add([type, name]);
  }
}