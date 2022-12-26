import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptik_food/pages/cart_screen/cart_screen_view.dart';
import 'package:ptik_food/style.dart';
import 'component/component.dart';
import 'home_screen_cubit.dart';
import 'home_screen_state.dart';

class Home_screenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Home_screenCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Image.asset(
            'assets/images/Hero.png',
          ),
          SizedBox(
            height: 31,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Menu kami",
                  style: blackBoldTextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 17,
                ),
                const CategoriesWidget(),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  "Mau makan apa?",
                  style: blackBoldTextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 17,
                ),
                const ProductWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
