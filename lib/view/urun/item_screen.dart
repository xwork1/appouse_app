import 'package:appouse_app/constant.dart';
import 'package:appouse_app/model/product_model.dart';
import 'package:appouse_app/view/urun/item_body.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  final ProductsModel productsModel;
  const ItemScreen({super.key, required this.productsModel});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ItemBody(
        products: widget.productsModel,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kGreenColor,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
      title: const Text(
        "Ürün Oluşturma/Güncelleme",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
