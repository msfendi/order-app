import 'package:flutter/material.dart';
import 'package:ptik_food/pages/home_screen/home_screen_view.dart';
import 'package:ptik_food/pages/slider_page.dart';
import 'package:ptik_food/style.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: whiteColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) => const SliderPage()));
            },
            icon: Icon(Icons.chevron_left)),
        Text(
          "Keranjang Belanja",
          style: blackSemiBoldTextStyle.copyWith(
              fontSize: 22, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 40,
        )
      ]),
    );
  }
}
