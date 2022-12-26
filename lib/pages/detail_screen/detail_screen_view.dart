import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptik_food/model/pref_profile_model.dart';
import 'package:ptik_food/services/firebase_db_services.dart';
import 'package:ptik_food/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_screen_cubit.dart';
import 'detail_screen_state.dart';

class Detail_screenPage extends StatefulWidget {
  final String nameProduct;
  final String deskripsi;
  final int harga;

  const Detail_screenPage(
      {super.key,
      required this.nameProduct,
      required this.deskripsi,
      required this.harga});
  @override
  State<Detail_screenPage> createState() => _Detail_screenPageState();
}

class _Detail_screenPageState extends State<Detail_screenPage> {
  bool isFavorited = false;
  int quantity = 1;
  late int dataHarga;
  late dynamic idUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataHarga = widget.harga;
    getPrev();
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = isFavorited ? false : true;
    });
  }

  void _minus() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        dataHarga = widget.harga * quantity;
      });
    }
  }

  void _tambah() {
    setState(() {
      quantity++;
      dataHarga = widget.harga * quantity;
    });
  }

  getPrev() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      idUser = sharedPreferences.getString(PrefProfile.uid);
    });
  }

  void addToCart(
      String nameProduct, int price, int totalPrice, int qtt, String uid) {
    var result = firebaseDBServices()
        .addProductToCart(
            nameProduct: nameProduct,
            price: price,
            quantity: qtt,
            uid: uid,
            total_price: totalPrice)
        .then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Detail_screenCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<Detail_screenCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(4),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Ink(
            decoration: const ShapeDecoration(
              color: Color(0xFFFEEDED),
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {
                toggleFavorite();
              },
              icon: isFavorited
                  ? iconFavorite(Icons.favorite)
                  : iconFavorite(Icons.favorite_border),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Image
          Container(
            margin: const EdgeInsets.fromLTRB(13.5, 20, 13.5, 11),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: const Image(
                image: AssetImage('assets/images/image9.png'),
                height: 274.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fontNunito(
                    size: 24,
                    style: blackBoldTextStyle,
                    teks: widget.nameProduct),
                ratings(),
                productDescription(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Tombol Jumlah
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _minus();
                    },
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 24,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(2),
                      primary: const Color(0xFFF54749),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: fontNunito(
                        size: 24,
                        style: blackSemiBoldTextStyle,
                        teks: quantity.toString()),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _tambah();
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(2),
                      primary: const Color(0xFFF54749),
                    ),
                  )
                ],
              ),
              // Tombol Beli dan Harga
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Rp. ${dataHarga}',
                      style: pinkBoldTextStyle.copyWith(fontSize: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addToCart(widget.nameProduct, widget.harga, dataHarga,
                            quantity, idUser);
                      },
                      child: Text('Beli',
                          style: whiteBoldTextStyle.copyWith(
                            fontSize: 20,
                          )),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 62.5,
                          vertical: 12.5,
                        ),
                        primary: const Color(0xFFF54749),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container productDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Text(widget.deskripsi,
          style: grayRegularTextStyle.copyWith(
            fontSize: 16,
            height: 1.2,
          )),
    );
  }

  Icon iconFavorite(IconData icon) {
    return Icon(
      icon,
      color: const Color(0xFFF54749),
      size: 28.0,
    );
  }

  Text fontNunito({String? teks, double? size, TextStyle? style}) {
    return Text(teks!,
        style: style!.copyWith(
          fontSize: size,
        ));
  }

  Container ratings() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          // Bintang
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: const Icon(
                    Icons.star,
                    color: Color(0xFFF54749),
                    size: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  child: const Icon(
                    Icons.star,
                    color: const Color(0xFFF54749),
                    size: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  child: const Icon(
                    Icons.star,
                    color: const Color(0xFFF54749),
                    size: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  child: const Icon(
                    Icons.star,
                    color: const Color(0xFFF54749),
                    size: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  child: const Icon(
                    Icons.star,
                    color: Color(0xFFF54749),
                    size: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  child: Text('4.8',
                      style: blackBoldTextStyle.copyWith(fontSize: 14)),
                ),
              ],
            ),
          ),
          // Icon
          Container(
            margin: const EdgeInsets.only(left: 4, right: 4),
            child: const Icon(
              Icons.timer_sharp,
              color: Color(0xFFF54749),
              size: 24,
            ),
          ),
          // Waktu
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: Text('20 min',
                style: blackBoldTextStyle.copyWith(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
