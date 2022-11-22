// ignore_for_file: use_build_context_synchronously

import 'package:appouse_app/model/posts_model.dart';
import 'package:appouse_app/model/product_model.dart';
import 'package:appouse_app/model/user_model.dart';
import 'package:appouse_app/widget/nav_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiServices {
//login

  Future<Users?> login(
      String username, String password, BuildContext context) async {
    const api = 'https://dummyjson.com/auth/login';
    final data = {"username": username, "password": password};

    final dio = Dio();
    Response response;
    try {
      response = await dio.post(api, data: data);
      if (response.statusCode == 200) {
        final body = response.data;

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NavBar()));

        return Users(username: username, token: body['token']);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "E-posta veya şifre hatalı",
      );
    }

    return null;
  }

//read
  Future<List<ProductsModel>> getProductData(String kategori) async {
    List<ProductsModel> _list = [];
    final url = 'https://dummyjson.com/products/$kategori';

    final dio = Dio();
    Response response;

    response = await dio.get(url);

    var body = response.data['products'];
    if (body is List) {
      _list = body.map((e) => ProductsModel.fromJson(e)).toList();
      print(body);
    } else {
      return [];
    }
    return _list;
  }

//update
  Future<List<ProductsModel>?> updateProduct(String id, Map payload) async {
    final url = 'https://dummyjson.com/products/$id';
    final data = {
      'title': payload['title'],
      'description': payload['description'],
      'price': payload['price'],
      'category': payload['category'],
      'thumbnail': payload['thumbnail'],
    };

    final dio = Dio();
    Response response;

    response = await dio.put(url, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      Fluttertoast.showToast(msg: "Güncelleme Başarılı");
      print(body);
    }
    return null;
  }

//create
  Future<List<ProductsModel>?> addProduct(Map payload) async {
    const url = 'https://dummyjson.com/products/add';
    final data = {
      'title': payload['title'],
      'description': payload['description'],
      'price': payload['price'],
      'category': payload['category'],
      'thumbnail': payload['thumbnail'],
    };

    final dio = Dio();
    Response response;

    response = await dio.post(url, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      Fluttertoast.showToast(msg: "Ekleme Başarılı");
      print(body);
    }
    return null;
  }

//delete
  Future<List<ProductsModel>?> deleteProduct(String id) async {
    final url = 'https://dummyjson.com/products/$id';

    final dio = Dio();
    Response response;

    response = await dio.delete(url);
    if (response.statusCode == 200) {
      final body = response.data;
      print(body);
    }
    return null;
  }

//pagination posts
  Future<List<Posts>> getCartsData({bool isRefresh = false}) async {
    List<Posts> _list = [];
    const limit = 25;
    const url = 'https://dummyjson.com/posts?limit=$limit';

    final dio = Dio();

    Response response;

    response = await dio.get(url);

    var body = response.data['posts'];
    if (body is List) {
      _list = body.map((e) => Posts.fromJson(e)).toList();
      if (_list.length < limit) {}
      print(body);
    } else {
      return [];
    }
    return _list;
  }
}
 /*  Future<List<ProductsModel>> getProductData(String kategori) async {
    List<ProductsModel> _list = [];
    final url = 'https://dummyjson.com/products/$kategori';

    final dio = Dio();
    Response response;
    if (_list[0].category != "laptops" || _list[0].category != "smartphones") {
      response = await dio.get(url);
      var body = response.data['products'];
      if (body is List) {
        _list = body.map((e) => ProductsModel.fromJson(e)).toList();
      }
    } else {
      return [];
    }
    return _list;
  } */