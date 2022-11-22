import 'package:appouse_app/constant.dart';
import 'package:appouse_app/view/login/login_screen.dart';
import 'package:appouse_app/widget/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(412, 732), //responsive olarak ekranı ayarlaması için
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Appouse Demo',
        theme: ThemeData(
          primaryColor: kGreenColor,
        ),
        home: const NavBar(),
      ),
    );
  }
}
