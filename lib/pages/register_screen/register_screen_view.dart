import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptik_food/pages/login_screen/login_screen_view.dart';
import 'package:ptik_food/services/firebase_auth_services.dart';
import 'package:ptik_food/style.dart';
import 'register_screen_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register_screenPage extends StatefulWidget {
  @override
  State<Register_screenPage> createState() => _Register_screenPageState();
}

class _Register_screenPageState extends State<Register_screenPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Register_screenCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    bool _secureText = true;
    final cubit = BlocProvider.of<Register_screenCubit>(context);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();
    FirebaseAuthServices fbServices = FirebaseAuthServices();

    register() async {
      fbServices
          .registerAkun(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${value?.user?.email} Sudah Berhasil Registrasi')));
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
                size: 24, teks: "Mari buat akun", style: blackBoldTextStyle),
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
          Container(
              height: 45,
              child: TextField(
                // obscureText: _secureText,
                controller: passwordConfirmController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: _secureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  filled: true,
                  fillColor: softPinkColor,
                  // labelText: 'Password',
                  hintText: 'Konfirmasi Password',
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
              register();
            },
            child: Text('Register',
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
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Login_screenPage();
                  },
                ),
              );
            },
            child: Center(
              child: Text("Punya Akun?",
                  style: pinkBoldTextStyle.copyWith(fontSize: 14)),
            ),
          )
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
