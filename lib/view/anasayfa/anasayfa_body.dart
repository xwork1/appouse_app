// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:appouse_app/constant.dart';
import 'package:appouse_app/controller/category_bar_controller.dart';
import 'package:appouse_app/services/api_services.dart';
import 'package:appouse_app/view/anasayfa/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late String data = ''; //category seçimi için apiye string veri gönderme
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(),
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.35 - 40,
                    decoration: const BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  categoryBar(),
                  Positioned(
                    top: 70,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: size.height - 100.h,
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
                      child: ProductsList(
                        data: data,
                      ), //ürün listeleme
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
 //kategori widget
  Widget categoryBar() {
    final CategoryBarController _categoryBarController =
        Get.put(CategoryBarController());
    return Container(
      margin: const EdgeInsets.all(kDefaultMargin),
      height: 50.h,
      decoration: const BoxDecoration(),
      child: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _categoryBarController.orders.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Obx(
            () => GestureDetector(
              onTap: (() {
                _categoryBarController.selectedIndex.value = index;
                if (index == 1) {
                  data = 'category/laptops';
                  ApiServices().getProductData(data);
                } else {
                  data = 'category/smartphones';
                  ApiServices().getProductData(data);
                }

                setState(() {});
              }),
              child: AnimatedContainer(
                margin: EdgeInsets.all(4.r),
                width: 150.w,
                decoration: BoxDecoration(
                  color: index == _categoryBarController.selectedIndex.value
                      ? kGreyColor
                      : kButtonColor,
                  borderRadius: BorderRadius.circular(
                    index == _categoryBarController.selectedIndex.value
                        ? 8
                        : 10,
                  ),
                ),
                duration: const Duration(milliseconds: 300),
                child: Center(
                  child: Text(
                    _categoryBarController.orders[index],
                    style: TextStyle(
                        color:
                            index == _categoryBarController.selectedIndex.value
                                ? Colors.white
                                : Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
