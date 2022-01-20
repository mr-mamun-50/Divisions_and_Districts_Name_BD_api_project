// To parse this JSON data, do
//
//     final divisionModel = divisionModelFromJson(jsonString);

import 'dart:convert';

List<DivisionModel> divisionModelFromJson(String str) =>
    List<DivisionModel>.from(
        json.decode(str).map((x) => DivisionModel.fromJson(x)));

String divisionModelToJson(List<DivisionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DivisionModel {
  DivisionModel({
    required this.id,
    required this.name,
    required this.bnName,
    required this.url,
  });

  String id;
  String name;
  String bnName;
  String url;

  factory DivisionModel.fromJson(Map<String, dynamic> json) => DivisionModel(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "url": url,
      };
}
