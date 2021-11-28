// To parse this JSON data, do
//
//     final showAllNuggetCategories = showAllNuggetCategoriesFromJson(jsonString);

import 'dart:convert';

ShowAllNuggetCategories showAllNuggetCategoriesFromJson(String str) => ShowAllNuggetCategories.fromJson(json.decode(str));

String showAllNuggetCategoriesToJson(ShowAllNuggetCategories data) => json.encode(data.toJson());

class ShowAllNuggetCategories {
  ShowAllNuggetCategories({
    required this.data,
  });

  List<NuggetCategories> data;

  factory ShowAllNuggetCategories.fromJson(Map<String, dynamic> json) => ShowAllNuggetCategories(
    data: List<NuggetCategories>.from(json["data"].map((x) => NuggetCategories.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NuggetCategories {
  NuggetCategories({
    required this.id,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String categoryName;
  DateTime createdAt;
  DateTime updatedAt;

  factory NuggetCategories.fromJson(Map<String, dynamic> json) => NuggetCategories(
    id: json["id"],
    categoryName: json["category_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
