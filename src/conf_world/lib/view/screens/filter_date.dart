import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterByDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3c096c),
        appBar: AppBar(
          title: Text("Filter By Date"),
          centerTitle: true,
          backgroundColor: Color(0xff5a189a)
        ),
    );
  }
}