import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/my_button.dart';
import 'filter_type.dart';
import 'navigation.dart';

class SearchConference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF3c096c),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterByType()),
              );
            },
            child: MyButton(
              name: 'Type',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: MyButton(
              name: 'Date - To Do',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Navigation(filter: 'SAVED')),
              );
            },
            child: MyButton(
              name: 'Saved Conferences',
            ),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Navigation(filter: 'false')),
              );
            },
            child: MyButton(
              name: 'See world map without filters',
            ),
          ),
        ],
      ),
    );
  }
}


