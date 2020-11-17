class ConferenceInfo {
  final String name;
  final String type;
  final String date;
  final String description;

  final double latitude;
  final double longitude;

  ConferenceInfo({this.name, this.type, this.date, this.description, this.latitude, this.longitude});

  ConferenceInfo.fromJson(Map<String, dynamic> json) :
        name = json['name'],
        type = json['type'],
        date = json['date'],
        description = json['description'],
        latitude = json['latitude'],
        longitude = json['longitude'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'type': type,
        'date': date,
        'description': description,
        'latitude': latitude,
        'longitude': longitude,
      };

}
