class ConferenceInfo {
  final String name;
  final String type;
  final String submitPaper;
  final String date;
  final String description;

  final double latitude;
  final double longitude;

  final String url;

  int saved;

  ConferenceInfo({this.name, this.type, this.submitPaper, this.date, this.description, this.latitude, this.longitude, this.url, this.saved});

  ConferenceInfo.fromJson(Map<String, dynamic> json) :
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

}
