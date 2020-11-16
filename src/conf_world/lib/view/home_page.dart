import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './navigation.dart';
import '../widgets/my_button.dart';

class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conf World"),
          centerTitle: true,
          backgroundColor: Colors.green[500],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation(filter: 'false')),
                  );
                },
                child: MyButton(
                  name: 'See World Map',
                ),
              ),
              FlatButton(
                onPressed: null,
                child: MyButton(
                  name: 'Exit',
                ),
              ),
            ],
          ),
        ));
  }
}