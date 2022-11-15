// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:appouse_app/constant.dart';
import 'package:appouse_app/model/product_model.dart';
import 'package:appouse_app/services/api_services.dart';
import 'package:appouse_app/view/urun/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class ProductsList extends StatefulWidget {
  final String data;
  const ProductsList({super.key, required this.data});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late String data;

  final ApiServices _apiServices = ApiServices();
  
  //ürünlerin listelendiği kısım
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiServices.getProductData(widget.data),
        builder: (context, snapshot) {
          List<ProductsModel> _productList;
          if (snapshot.hasData) {
            _productList = snapshot.data!;
            return ListView.builder(
              itemCount: _productList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemScreen(
                      productsModel: _productList[index],
                    ),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  margin: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                      color: kBoldGreyColor,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Ürün İD: ${_productList[index].id}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              maxLines: 2,
                              'Adı: ${_productList[index].title}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "Fiyat: ${_productList[index].price} ₺",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Image.network(
                              '${_productList[index].thumbnail}',
                              fit: BoxFit.contain,
                              height: 100.h,
                              width: 100.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Hata çıktı'),
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: Colors.green, size: 30),
            );
          }
        });
  }
}
