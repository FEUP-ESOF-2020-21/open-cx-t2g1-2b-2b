import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MapRoute.dart';
import 'MyButton.dart';

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conf World',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Conf World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  //MyHomePageState createState() => MyHomePageState();
}

*/

void main() {
  runApp(MaterialApp(
    home: HomePageState(),
  ));
}

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
              /*
              Container(
                // Usar expanded em vez de containter depois
                child: Image.asset(
                  'assets/main-menu.png',
                  height: 100,
                  width: 100,
                ),
              ),
              
              */
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapRoute()),
                  );
                },
                child: MyButton(
                  name: 'See World Map',
                ),
              ),
              FlatButton(
                child: MyButton(
                  name: 'Exit',
                ),
              ),
            ],
          ),
        ));
  }
}

