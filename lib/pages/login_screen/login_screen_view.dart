import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptik_food/model/pref_profile_model.dart';
import 'package:ptik_food/pages/home_screen/home_screen_view.dart';
import 'package:ptik_food/pages/register_screen/register_screen_view.dart';
import 'package:ptik_food/pages/slider_page.dart';
import 'package:ptik_food/services/firebase_auth_services.dart';
import 'package:ptik_food/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen_cubit.dart';
import 'login_screen_state.dart';

class Login_screenPage extends StatefulWidget {
  @override
  State<Login_screenPage> createState() => _Login_screenPageState();
}

class _Login_screenPageState extends State<Login_screenPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Login_screenCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final cubit = BlocProvider.of<Login_screenCubit>(context);
    bool _secureText = true;

    FirebaseAuthServices fbServices = FirebaseAuthServices();

    savePref(String uid, String email, String name) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        sharedPreferences.setString(PrefProfile.uid, uid);
        sharedPreferences.setString(PrefProfile.email, email);
        sharedPreferences.setString(PrefProfile.name, name);
      });
    }

    login() async {
      fbServices
          .loginAkun(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        final uid = value?.user?.uid;
        final email = value?.user?.email;
        final name = value?.user?.displayName;
        savePref(uid.toString(), email.toString(), name.toString());
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${value?.user?.email} Berhasil Login')));
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SliderPage(),
        ));
      });
    }

    void showHide() {
      setState(() {
        _secureText = !_secureText;
      });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        padding: EdgeInsets.fromLTRB(46, 140, 46, 0),
        // scrollDirection: vertia,
        // shrinkWrap: true,
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 65,
          ),
          Center(
            child: fontNunito(
                size: 24, teks: "Masuk dulu Yukk!", style: blackBoldTextStyle),
          ),
          const SizedBox(
            height: 28,
          ),
          Container(
              height: 45,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: softPinkColor,
                    // labelText: 'Email Name',
                    hintText: 'Email Name',
                    hintStyle: const TextStyle(
                        color: Color(0xFFC8393B),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'nunito'),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 45,
              child: TextField(
                // obscureText: _secureText,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: _secureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  filled: true,
                  fillColor: softPinkColor,
                  // labelText: 'Password',
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      color: Color(0xFFC8393B),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'nunito'),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              login();
            },
            child: Text('Login',
                style: whiteBoldTextStyle.copyWith(
                  fontSize: 16,
                )),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 62.5,
                vertical: 12.5,
              ),
              primary: pinkStrongColor,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Text("Lupa Password?",
                  style: grayMediumTextStyle.copyWith(fontSize: 14)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Belum punya akun ya? ",
                style: grayMediumTextStyle.copyWith(fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Register_screenPage();
                      },
                    ),
                  );
                },
                child: Text("Buat Akun",
                    style: pinkBoldTextStyle.copyWith(fontSize: 14)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Text fontNunito({String? teks, double? size, TextStyle? style}) {
    return Text(teks!,
        style: style!.copyWith(
          fontSize: size,
        ));
  }
}
