class ConferenceInfo {
  final String name;
  final String type;
  final String date;
  final String description;

  final double latitude;
  final double longitude;

  final String url;

  ConferenceInfo({this.name, this.type, this.date, this.description, this.latitude, this.longitude, this.url});

  ConferenceInfo.fromJson(Map<String, dynamic> json) :
        name = json['name'],
        type = json['type'],
        date = json['date'],
        description = json['description'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        url = json['url'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'type': type,
        'date': date,
        'description': description,
        'latitude': latitude,
        'longitude': longitude,
        'url': url,
      };

}
