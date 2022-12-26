import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/component.dart';

import 'cart_screen_cubit.dart';
import 'cart_screen_state.dart';

class Cart_screenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Cart_screenCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Cart_screenCubit>(context);
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: ListView(
        // ignore: prefer_const_constructors
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const AppbarWidget(),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: CartWidget(),
          ),
        ],
      ),
    );
  }
}
