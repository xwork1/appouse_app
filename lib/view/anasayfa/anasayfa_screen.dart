import 'package:appouse_app/constant.dart';
import 'package:appouse_app/model/product_model.dart';
import 'package:appouse_app/view/anasayfa/anasayfa_body.dart';
import 'package:appouse_app/view/urun/item_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _list = ProductsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const HomeBody(),
    );
  }
  
  //appbar widget
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kGreenColor,
      centerTitle: true,
      elevation: 0,
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      title: const Text("Ürünler"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.list),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemScreen(productsModel: _list),
              ),
            );
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
