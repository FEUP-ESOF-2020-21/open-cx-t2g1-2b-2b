import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/screens/world_map.dart';
import 'package:conf_world/view/widgets/conference_icon.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MarkerModel {
  final double width = 200.0;
  final double height = 50.0;

  final ConferenceModel conference;

  MarkerModel(this.conference);

  getMarker() {
    return new Marker(
      anchorPos: AnchorPos.align(AnchorAlign.top),
      width: this.width,
      height: this.height,
      point: new LatLng(conference.latitude, conference.longitude),
      builder: (ctx) =>
        new ConferenceIcon(
          model: conference,
        ),
    );
  }
}
