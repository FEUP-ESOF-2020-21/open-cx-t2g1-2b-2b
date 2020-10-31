import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/widgets.dart';

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
                    MaterialPageRoute(builder: (context) => SecondRoute()),
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

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Conf World')),
        body: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']
            ),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: new LatLng(51.5, -0.09),
                  builder: (ctx) =>
                  new Container(
                    child: new FlutterLogo(), // Aparece o marcador
                  ),
                ),
              ],
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
