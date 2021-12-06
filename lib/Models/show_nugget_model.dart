// To parse this JSON data, do
//
//     final showNuggetsModel = showNuggetsModelFromJson(jsonString);

import 'dart:convert';

ShowNuggetsModel showNuggetsModelFromJson(String str) => ShowNuggetsModel.fromJson(json.decode(str));

String showNuggetsModelToJson(ShowNuggetsModel data) => json.encode(data.toJson());

class ShowNuggetsModel {
  ShowNuggetsModel({
    required this.data,
  });

  Data data;

  factory ShowNuggetsModel.fromJson(Map<String, dynamic> json) => ShowNuggetsModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.quote,
    required this.author,
    this.image,
    required this.categoryId,
    required this.scheduledDate,
    required this.isSent,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String quote;
  String author;
  dynamic image;
  int categoryId;
  DateTime scheduledDate;
  int isSent;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    quote: json["quote"],
    author: json["author"],
    image: json["image"],
    categoryId: json["category_id"],
    scheduledDate: DateTime.parse(json["scheduled_date"]),
    isSent: json["isSent"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "quote": quote,
    "author": author,
    "image": image,
    "category_id": categoryId,
    "scheduled_date": scheduledDate.toIso8601String(),
    "isSent": isSent,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
