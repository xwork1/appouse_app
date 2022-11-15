// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
    ProductsModel({
        this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images,
    });

    int? id;
    String? title;
    String? description;
    int? price;
    double? discountPercentage;
    double? rating;
    int? stock;
    String? brand;
    String? category;
    String? thumbnail;
    List<String>? images;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        discountPercentage: json["discountPercentage"] == null ? null : json["discountPercentage"].toDouble(),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        stock: json["stock"] == null ? null : json["stock"],
        brand: json["brand"] == null ? null : json["brand"],
        category: json["category"] == null ? null : json["category"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "discountPercentage": discountPercentage == null ? null : discountPercentage,
        "rating": rating == null ? null : rating,
        "stock": stock == null ? null : stock,
        "brand": brand == null ? null : brand,
        "category": category == null ? null : category,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
    };
}
