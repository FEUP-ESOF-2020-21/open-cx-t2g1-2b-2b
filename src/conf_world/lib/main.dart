import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView (
          children: <Widget>[
            MyButton(
                name: 'See World Map'
            ),
            MyButton(
                name: 'Exit',
            ),
          ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({Key key, this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.name),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.lightGreenAccent,
      ),
      alignment: Alignment.center,
    );
  }
}
