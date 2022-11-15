// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.id,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.gender,
        this.image,
        this.token,
    });

    int? id;
    String? username;
    String? email;
    String? firstName;
    String? lastName;
    String? gender;
    String? image;
    String? token;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        gender: json["gender"] == null ? null : json["gender"],
        image: json["image"] == null ? null : json["image"],
        token: json["token"] == null ? null : json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "gender": gender == null ? null : gender,
        "image": image == null ? null : image,
        "token": token == null ? null : token,
    };
}
