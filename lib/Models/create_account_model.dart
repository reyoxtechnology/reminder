import 'dart:convert';

GetUserDetailsModelResponse getUserDetailsModelResponseFromJson(String str) => GetUserDetailsModelResponse.fromJson(json.decode(str));

String getUserDetailsModelResponseToJson(GetUserDetailsModelResponse data) => json.encode(data.toJson());

class GetUserDetailsModelResponse {
  GetUserDetailsModelResponse({
    required this.message,
    required this.data,
    required this.token,
  });

  String message;
  Data data;
  String token;

  factory GetUserDetailsModelResponse.fromJson(Map<String, dynamic> json) => GetUserDetailsModelResponse(
    message: json["message"],
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
    "token": token,
  };
}

class Data {
  Data({
    required this.name,
    required this.email,
    this.referralCode,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String email;
  dynamic referralCode;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    referralCode: json["referral_code"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "referral_code": referralCode,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}