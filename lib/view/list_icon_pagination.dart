import 'dart:convert';

import 'package:appouse_app/constant.dart';
import 'package:appouse_app/model/posts_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PaginationCarts extends StatefulWidget {
  const PaginationCarts({super.key});

  @override
  State<PaginationCarts> createState() => _PaginationCartsState();
}

class _PaginationCartsState extends State<PaginationCarts> {
  final scrollController = ScrollController();
  bool isLoading = true;
  List<Posts> _list = [];
  int limit = 25;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    getCartsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getCartsData(),
        builder: (context, snapshot) {
          List<Posts> posts;
          if (snapshot.hasData) {
            posts = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.all(kDefaultPadding),
              controller: scrollController,
              itemCount: isLoading ? posts.length + 10 : posts.length,
              itemBuilder: (context, index) {
                if (index < posts.length) {
                  final post = _list[index].tags;
                  final title = _list[index].title;
                  final user = _list[index].id;
                  return SingleChildScrollView(
                    child: Card(
                      child: ListTile(
                        leading: Text(user.toString()),
                        title: Text(title.toString()),
                        subtitle: Text(post.toString()),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Posts>> getCartsData() async {
    final url = 'https://dummyjson.com/posts?limit=$limit';
    print(url);
    final dio = Dio();

    Response response;

    response = await dio.get(url);

    var body = response.data['posts'];
    if (body is List) {
      _list = body.map((e) => Posts.fromJson(e)).toList();
    } else {
      return [];
    }
    return _list;
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      limit = limit + 10;
      await getCartsData();
    } else {
      isLoading = false;
    }
  }
}
