import 'dart:ui';

class FilterTypeModel {
  final Color backgroundColor = Color(0xFF303030);

  final String appBarName = 'Conference Types';
  final Color appBarBackgroundColor = Color(0xffF4845F);

  List<String> types = [];

  setType(List<String> types) {
    this.types = types;
  }
}