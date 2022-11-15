// ignore_for_file: prefer_if_null_operators

import 'package:appouse_app/constant.dart';
import 'package:appouse_app/model/product_model.dart';
import 'package:appouse_app/services/api_services.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemBody extends StatefulWidget {
  final ProductsModel products;
  const ItemBody({super.key, required this.products});

  @override
  State<ItemBody> createState() => _ItemBodyState();
}

class _ItemBodyState extends State<ItemBody> {
  final _editTitleController = TextEditingController();
  final _editDescriptionController = TextEditingController();
  final _editPriceController = TextEditingController();
  final _editCategoryController = TextEditingController();
  final _editUploadimgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //cihaz ekranına göre size alma
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.3 - 40,
                  decoration: const BoxDecoration(
                    color: kGreenColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(kDefaultMargin),
                  height: 70.h,
                  decoration: const BoxDecoration(color: kGreenColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Ürün ID: ${widget.products.id != null ? widget.products.id : ''}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "Ürün Başlığı: ${widget.products.title != null ? widget.products.title : ''}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                itemList(size),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //Tıklanılan ürünlerin bilgileri
  Positioned itemList(Size size) {
    return Positioned(
                top: 100.h,
                right: 5,
                left: 5,
                child: Container(
                  height: size.height,
                  margin: const EdgeInsets.all(kDefaultMargin),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 0.3,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Ürün ID: ${widget.products.id != null ? widget.products.id : ''}"),
                            const Divider(),
                            TextField(
                              controller: _editTitleController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText:
                                      'Ürün Başlığı: ${widget.products.title != null ? widget.products.title : ''}',
                                  hintText: widget.products.title != null
                                      ? widget.products.title
                                      : ''),
                            ),
                            const Divider(),
                            TextField(
                              controller: _editDescriptionController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText:
                                      'Ürün Açıklaması: ${widget.products.description != null ? widget.products.description : ''}',
                                  hintText:
                                      widget.products.description != null
                                          ? widget.products.description
                                          : ''),
                            ),
                            const Divider(),
                            TextField(
                              controller: _editPriceController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText:
                                      'Fiyat: ${widget.products.price != null ? widget.products.price : ''}',
                                  hintText: widget.products.price != null
                                      ? widget.products.price.toString()
                                      : ''),
                            ),
                            const Divider(),
                            TextField(
                              controller: _editCategoryController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText:
                                      'Kategori: ${widget.products.category != null ? widget.products.category : ''}',
                                  hintText: widget.products.category != null
                                      ? widget.products.category
                                      : ''),
                            ),
                            const Divider(),
                            TextField(
                              controller: _editUploadimgController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText:
                                      'Resim Yükle: ${widget.products.thumbnail != null ? widget.products.thumbnail : ''}',
                                  hintText: widget.products.thumbnail != null
                                      ? widget.products.thumbnail != null
                                          ? widget.products.thumbnail
                                          : ''
                                      : ''),
                            ),
                            const Divider(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kSaveColor
                              ),
                              child: const Text("KAYDET"),
                              onPressed: () {
                                final Map payload = {
                                  'title': _editTitleController.text,
                                  'description':
                                      _editDescriptionController.text,
                                  'price': _editPriceController.text,
                                  'category': _editCategoryController.text,
                                  'thumbnail': _editUploadimgController.text,
                                };
                                if (widget.products.id == null) {
                                  ApiServices().addProduct(payload);
                                } else {
                                  ApiServices().updateProduct(
                                      widget.products.id.toString(), payload);
                                }
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kRedColor
                              ),
                              child: const Text(
                                "Sil",
                                textAlign: TextAlign.center,
                                
                              ),
                              onPressed: () {
                                ApiServices().deleteProduct(
                                    widget.products.id.toString());
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
  }
}
