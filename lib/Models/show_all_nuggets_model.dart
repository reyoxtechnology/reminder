// To parse this JSON data, do
//
//     final getAllNuggetsModelResponse = getAllNuggetsModelResponseFromJson(jsonString);

import 'dart:convert';

GetAllNuggetsModelResponse getAllNuggetsModelResponseFromJson (String str) => GetAllNuggetsModelResponse.fromJson(json.decode(str));

String getAllNuggetsModelResponseToJson(GetAllNuggetsModelResponse data) => json.encode(data.toJson());

class GetAllNuggetsModelResponse {
  GetAllNuggetsModelResponse({
    required this.data,
  });

  Data data;

  factory GetAllNuggetsModelResponse.fromJson(Map<String, dynamic> json) => GetAllNuggetsModelResponse(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
  });

  int currentPage;
  List<Nugget> data;
  String firstPageUrl;
  int from;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Nugget>.from(json["data"].map((x) => Nugget.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
  };
}

class Nugget {
  Nugget({
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

  factory Nugget.fromJson(Map<String, dynamic> json) => Nugget(
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
