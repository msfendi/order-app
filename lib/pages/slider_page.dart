import 'package:flutter/material.dart';
import 'package:ptik_food/model/pref_profile_model.dart';
import 'package:ptik_food/pages/cart_screen/cart_screen_view.dart';
import 'package:ptik_food/pages/favorite_screen.dart';
import 'package:ptik_food/pages/home_screen/home_screen_view.dart';
import 'package:ptik_food/pages/login_screen/login_screen_view.dart';
import 'package:ptik_food/pages/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _pageIndex = 0;
  dynamic idUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrev();
  }

  getPrev() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      idUser = sharedPreferences.getString(PrefProfile.uid);
    });
    // if (idUser == null) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => Login_screenPage()));
    // } else {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const SliderPage()));
    // }
  }

  final pages = [
    Home_screenPage(),
    Cart_screenPage(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorit",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        unselectedItemColor: Color(0xFF808080),
        // unselectedLabelStyle: GoogleFonts.nunito(
        //   textStyle: TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        // selectedItemColor: Color(0xFFF54749),
        // selectedLabelStyle: GoogleFonts.nunito(
        //   textStyle: TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ),
    );
  }
}
