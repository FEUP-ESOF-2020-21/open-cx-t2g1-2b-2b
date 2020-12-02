import 'dart:ui';

import 'package:conf_world/controller/database.dart';
import 'package:conf_world/view/widgets/conference_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ConferenceModel {
  // Conference Details Colors
  final Color colorBackground = Color(0xff3C096C);
  final Color colorForeground = Color(0xff5a189a);
  final Color informationColor = Color(0xffe0aaff);
  final Color detailsTextColor = Color(0xffffffff);

  // Conference Marker Colors
  final Color savedIconColor = Color(0xfffada5e);
  final Color normalIconColor = Color(0xff7b2cbf);
  final Color markerTextColor = Color(0xffe0aaff);

  // Conference Information Fields
  final int id;
  final String name;
  final String type;
  final String submitPaper;
  final String date;
  final String description;
  final double latitude;
  final double longitude;
  final String url;
  int saved;

  ConferenceModel({this.id, this.name, this.type, this.submitPaper, this.date, this.description, this.latitude, this.longitude, this.url, this.saved});

  ConferenceModel.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        type = json['type'],
        date = json['date'],
        submitPaper = json['submitPaper'],
        description = json['description'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        url = json['url'],
        saved = json['saved'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'name': name,
        'type': type,
        'submitPaper': submitPaper,
        'date': date,
        'description': description,
        'latitude': latitude,
        'longitude': longitude,
        'url': url,
        'saved': saved,
      };

  getIconColor() {
    if(saved == 1) return savedIconColor;
    else return normalIconColor;
  }

  updateSaved(widget) async {
    saved = (saved + 1) % 2;

    DatabaseHelper db = new DatabaseHelper();

    await db.updateSaved(this);

    widget.setState(() {}); // Update menu
  }

  launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  isSaved() {
    if(saved == 1) return "This conference is saved";
    else return "Not saved";
  }
}
