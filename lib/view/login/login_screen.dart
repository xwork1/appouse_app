import 'package:appouse_app/constant.dart';
import 'package:appouse_app/view/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    width: 200.w,
                    height: 160.h,
                    color: kRedColor,
                    child: const Center(
                      child: Text(
                        "LOGO",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Uygulamaya Hoşgeldiniz",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    "Uygulamamıza giriş yapmak için bilgilerinizi doldurunuz.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
