import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
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
  MyMapState createState() => MyMapState();
  //MyHomePageState createState() => MyHomePageState();
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

class MyMapState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Conf World')),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(40.71, -74.00), minZoom: 50.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(40.73, -74.00),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
              ])
            ]));
  }
}
