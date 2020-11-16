import 'package:conf_world/widgets/conference_icon.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class ConferenceMarker {
  var markers = <Marker>[];

  final conferences;
  final double width = 200.0;
  final double height = 50.0;
  final String filter;

  ConferenceMarker(this.conferences, this.filter) {
    _initMarkers();
  }

  void _initMarkers() {
    for(var conferenceD in conferences) {
      if((this.filter == conferenceD.type) || (this.filter == 'false')) {
        this.markers.add(new Marker(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          width: this.width,
          height: this.height,
          point: new LatLng(conferenceD.latitude, conferenceD.longitude),
          builder: (ctx) =>
          new ConferenceIcon(
            conference: conferenceD,
          ),
        ),
        );
      }
    }
  }
}