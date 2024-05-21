import 'dart:convert';

class CompanyResponseModel {
  final String? message;
  final Company? company;

  CompanyResponseModel({
    this.message,
    this.company,
  });

  factory CompanyResponseModel.fromJson(String str) =>
      CompanyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyResponseModel.fromMap(Map<String, dynamic> json) =>
      CompanyResponseModel(
        message: json["message"],
        company:
            json["company"] == null ? null : Company.fromMap(json["company"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "company": company?.toMap(),
      };
}

class Company {
  final int? id;
  final String? name;
  final String? latitude;
  final String? longitude;
  final String? phoneNumber;
  final String? email;
  final String? website;
  final String? address;
  final String? radiusKm;
  final String? timeIn;
  final String? timeOut;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Company({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.phoneNumber,
    this.email,
    this.website,
    this.address,
    this.radiusKm,
    this.timeIn,
    this.timeOut,
    this.createdAt,
    this.updatedAt,
  });

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        website: json["website"],
        address: json["address"],
        radiusKm: json["radius_km"],
        timeIn: json["time_in"],
        timeOut: json["time_out"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "phone_number": phoneNumber,
        "email": email,
        "website": website,
        "address": address,
        "radius_km": radiusKm,
        "time_in": timeIn,
        "time_out": timeOut,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
