// To parse this JSON data, do
//
//     final showAllNuggetsInACategory = showAllNuggetsInACategoryFromJson(jsonString);

import 'dart:convert';

ShowAllNuggetsInACategory showAllNuggetsInACategoryFromJson(String str) => ShowAllNuggetsInACategory.fromJson(json.decode(str));

String showAllNuggetsInACategoryToJson(ShowAllNuggetsInACategory data) => json.encode(data.toJson());

class ShowAllNuggetsInACategory {
  ShowAllNuggetsInACategory({
    required this.data,
  });

  List<NuggetsInACategory> data;

  factory ShowAllNuggetsInACategory.fromJson(Map<String, dynamic> json) => ShowAllNuggetsInACategory(
    data: List<NuggetsInACategory>.from(json["data"].map((x) => NuggetsInACategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NuggetsInACategory {
  NuggetsInACategory({
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

  factory NuggetsInACategory.fromJson(Map<String, dynamic> json) => NuggetsInACategory(
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
