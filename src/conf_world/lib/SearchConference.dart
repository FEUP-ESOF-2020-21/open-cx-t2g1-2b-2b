import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MyButton.dart';

class SearchConference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: MyButton(
            name: 'Type',
          ),
        ),
        FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: MyButton(
            name: 'Date',
          ),
        ),
        FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: MyButton(
            name: 'SaveConferences',
          ),
        ),
      ],
    );
  }
}
