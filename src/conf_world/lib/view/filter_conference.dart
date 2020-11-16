import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/my_button.dart';
import 'filter_type.dart';

class SearchConference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
      ),
    );
  }
}


