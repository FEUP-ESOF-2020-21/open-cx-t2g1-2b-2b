import 'dart:ui';

class ConferenceModel {
  // Conference Details Colors
  final Color colorBackground = Color(0xff3C096C);
  final Color colorForeground = Color(0xff5a189a);
  final Color informationColor = Color(0xffe0aaff);
  final Color detailsTextColor = Color(0xffffffff);

  // Conference Marker Colors
  final Color savedIconColor = Color(0xfffada5e);
  final Color markerSavedTextColor = Color(0xff3C096C);

  final Color normalIconColor = Color(0xff7b2cbf);
  final Color markerNormalTextColor = Color(0xffe0aaff);

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

  getTextColor() {
    if(saved == 1) return markerSavedTextColor;
    else return markerNormalTextColor;
  }

  isSaved() {
    if(saved == 1) return "This conference is saved";
    else return "Not saved";
  }
}
