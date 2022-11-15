import 'package:appouse_app/constant.dart';
import 'package:appouse_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late bool _passwordVisible; //şifre gizleme

  @override
  void initState() {
    super.initState();

    _passwordVisible = false; //şifre gizleme 
  }

  //login form kısımlarının olduğu yer
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                focusedBorder: kOutlineBorder,
                hintText: "E-mail",
                hintStyle: const TextStyle(color: kGreyColor),
                enabledBorder: kOutlineBorder,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              obscureText: !_passwordVisible, //şifre gizleme
              controller: _passwordController, //şifre gizleme
              decoration: InputDecoration(
                focusedBorder: kOutlineBorder,
                hintText: "Şifre",
                hintStyle: const TextStyle(color: kGreyColor),
                enabledBorder: kOutlineBorder,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off, 
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 100.w * 4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kGreenColor),
                onPressed: () {
                  ApiServices().login(
                      _emailController.text, _passwordController.text, context);
                },
                child: const Text("Giriş Yap"),
              ),
            ),
            Row(
              children: const <Widget>[
                Icon(
                  color: kGreenColor,
                  Icons.warning,
                ),
                Text(
                  "Sorun yaşıyor iseniz IT birimi ile görüşünüz",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
