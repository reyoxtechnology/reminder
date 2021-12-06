// To parse this JSON data, do
//
//     final notificationResponseModel = notificationResponseModelFromJson(jsonString);

import 'dart:convert';

NotificationResponseModel notificationResponseModelFromJson(String str) => NotificationResponseModel.fromJson(json.decode(str));

String notificationResponseModelToJson(NotificationResponseModel data) => json.encode(data.toJson());

class NotificationResponseModel {
  NotificationResponseModel({
    required this.unread,
    required this.readNotif,
  });

  List<Unread> unread;
  List<dynamic> readNotif;

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) => NotificationResponseModel(
    unread: List<Unread>.from(json["unread"].map((x) => Unread.fromJson(x))),
    readNotif: List<dynamic>.from(json["readNotif"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "unread": List<dynamic>.from(unread.map((x) => x.toJson())),
    "readNotif": List<dynamic>.from(readNotif.map((x) => x)),
  };
}

class Unread {
  Unread({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String type;
  String notifiableType;
  int notifiableId;
  Data data;
  dynamic readAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Unread.fromJson(Map<String, dynamic> json) => Unread(
    id: json["id"],
    type: json["type"],
    notifiableType: json["notifiable_type"],
    notifiableId: json["notifiable_id"],
    data: Data.fromJson(json["data"]),
    readAt: json["read_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "notifiable_type": notifiableType,
    "notifiable_id": notifiableId,
    "data": data.toJson(),
    "read_at": readAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Data {
  Data({
    required this.title,
    required this.quote,
    required this.author,
  });

  String title;
  String quote;
  String author;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    quote: json["quote"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "quote": quote,
    "author": author,
  };
}
