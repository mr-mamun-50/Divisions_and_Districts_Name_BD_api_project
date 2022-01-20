// To parse this JSON data, do
//
//     final distric = districFromJson(jsonString);

import 'dart:convert';

List<Distric> districFromJson(String str) =>
    List<Distric>.from(json.decode(str).map((x) => Distric.fromJson(x)));

String districToJson(List<Distric> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Distric {
  Distric({
    required this.id,
    required this.divisionId,
    required this.name,
    required this.bnName,
    required this.lat,
    required this.lon,
    required this.url,
  });

  String id;
  String divisionId;
  String name;
  String bnName;
  String lat;
  String lon;
  String url;

  factory Distric.fromJson(Map<String, dynamic> json) => Distric(
        id: json["id"],
        divisionId: json["division_id"],
        name: json["name"],
        bnName: json["bn_name"],
        lat: json["lat"] == null ? '' : json["lat"],
        lon: json["lon"] == null ? '' : json["lon"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "division_id": divisionId,
        "name": name,
        "bn_name": bnName,
        "lat": lat == null ? '' : lat,
        "lon": lon == null ? '' : lon,
        "url": url,
      };
}
