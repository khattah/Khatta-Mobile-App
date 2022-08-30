// To parse this JSON data, do
//
//     final muller = mullerFromJson(jsonString);

import 'dart:convert';

Muller mullerFromJson(String str) => Muller.fromJson(json.decode(str));

String mullerToJson(Muller data) => json.encode(data.toJson());

class Muller {
  Muller({
    this.id,
    this.userName,
    this.address,
  });

  int id;
  String userName;
  Address address;

  Muller copyWith({int id, String userName, Address address}) => Muller(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        address: address ?? this.address,
      );

  factory Muller.fromJson(Map<String, dynamic> json) => Muller(
        id: json["id"] == null ? null : json["id"],
        userName: json["userName"] == null ? null : json["userName"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userName": userName == null ? null : userName,
        "address": address == null ? null : address.toJson(),
      };
}

class Address {
  Address({
    this.lang,
    this.lat,
  });

  int lang;
  double lat;

  Address copyWith({int lang, double lat}) => Address(
        lang: lang ?? this.lang,
        lat: lat ?? this.lat,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        lang: json["lang"] ?? 00,
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lang": lang == null ? null : lang,
        "lat": lat == null ? null : lat,
      };
}
