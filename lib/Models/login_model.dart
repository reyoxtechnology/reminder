import 'dart:convert';

UserLoginModelResponse userLoginModelResponseFromJson(String str) => UserLoginModelResponse.fromJson(json.decode(str));

String userLoginModelResponseToJson(UserLoginModelResponse data) => json.encode(data.toJson());

class UserLoginModelResponse {
  UserLoginModelResponse({
    required this.message,
    required this.data,
    required this.token,
  });

  String message;
  Data data;
  String token;

  factory UserLoginModelResponse.fromJson(Map<String, dynamic> json) => UserLoginModelResponse(
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
    required this.id,
    required this.name,
    required this.email,
    this.provider,
    this.providerId,
    this.gender,
    this.phoneNumber,
    this.interests,
    required this.isAdmin,
    required this.remindTime,
    required this.freeTrial,
    required this.expireAt,
    this.referralCode,
    required this.subscribed,
    this.emailVerifiedAt,
    required this.ratingId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  dynamic provider;
  dynamic providerId;
  dynamic gender;
  dynamic phoneNumber;
  dynamic interests;
  int isAdmin;
  String remindTime;
  int freeTrial;
  DateTime expireAt;
  dynamic referralCode;
  int subscribed;
  dynamic emailVerifiedAt;
  int ratingId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    provider: json["provider"],
    providerId: json["provider_id"],
    gender: json["gender"],
    phoneNumber: json["phone_number"],
    interests: json["interests"],
    isAdmin: json["isAdmin"],
    remindTime: json["remind_time"],
    freeTrial: json["free_trial"],
    expireAt: DateTime.parse(json["expire_at"]),
    referralCode: json["referral_code"],
    subscribed: json["subscribed"],
    emailVerifiedAt: json["email_verified_at"],
    ratingId: json["rating_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "provider": provider,
    "provider_id": providerId,
    "gender": gender,
    "phone_number": phoneNumber,
    "interests": interests,
    "isAdmin": isAdmin,
    "remind_time": remindTime,
    "free_trial": freeTrial,
    "expire_at": expireAt.toIso8601String(),
    "referral_code": referralCode,
    "subscribed": subscribed,
    "email_verified_at": emailVerifiedAt,
    "rating_id": ratingId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
