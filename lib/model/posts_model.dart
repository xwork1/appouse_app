// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.id,
    this.title,
    this.body,
    this.userId,
    this.tags,
    this.reactions,
  });

  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        userId: json["userId"] == null ? null : json["userId"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        reactions: json["reactions"] == null ? null : json["reactions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "userId": userId == null ? null : userId,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "reactions": reactions == null ? null : reactions,
      };
}
