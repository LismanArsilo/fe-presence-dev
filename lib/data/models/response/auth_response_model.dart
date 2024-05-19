// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final User? user;
  final String? token;

  AuthResponseModel({
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "user": user?.toMap(),
        "token": token,
      };

  AuthResponseModel copyWith({
    String? message,
    User? user,
    String? token,
  }) {
    return AuthResponseModel(
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}

class User {
  final int? id;
  final int? roleId;
  final int? positionId;
  final int? unitId;
  final String? username;
  final String? fullname;
  final String? email;
  final String? phone;
  final dynamic joinDate;
  final dynamic emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final String? faceEmbedding;
  final dynamic imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.roleId,
    this.positionId,
    this.unitId,
    this.username,
    this.fullname,
    this.email,
    this.phone,
    this.joinDate,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.faceEmbedding,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"],
        positionId: json["position_id"],
        unitId: json["unit_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        joinDate: json["join_date"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        faceEmbedding: json["face_embedding"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "role_id": roleId,
        "position_id": positionId,
        "unit_id": unitId,
        "username": username,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "join_date": joinDate,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "face_embedding": faceEmbedding,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
