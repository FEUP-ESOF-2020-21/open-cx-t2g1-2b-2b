import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:conf_world/controller/map_conference_controller.dart';
import 'package:conf_world/model/conference_model.dart';
import 'package:conf_world/view/widgets/conference_pinpoint.dart';

class MarkerModel { // Ask teacher about this class
  static Marker createMarker(MapConferenceController controller, ConferenceModel conference) {
    return new Marker(
      anchorPos: AnchorPos.align(AnchorAlign.top),
      width: 200.0,
      height: 50.0,
      point: new LatLng(conference.latitude, conference.longitude),
      builder: (ctx) =>
        new ConferencePinpoint(
          controller: controller,
          model: conference,
        ),
    );
  }
}
