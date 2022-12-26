import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ptik_food/model/pref_profile_model.dart';
import 'package:ptik_food/pages/cart_screen/cart_screen_cubit.dart';
import 'package:ptik_food/pages/cart_screen/cart_screen_state.dart';
import 'package:ptik_food/pages/cart_screen/component/component.dart';
import 'package:ptik_food/pages/detail_screen/edit_detail_screen.dart';
import 'package:ptik_food/services/firebase_db_services.dart';
import 'package:ptik_food/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int total = 0;
  String idUser = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrev();
  }

  // Future<QuerySnapshot<Map<String, dynamic>>> getCart(String userId) async {
  //   var result = await firebaseDBServices().getMyCart(userId);
  //   return result;
  // }

  getPrev() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      idUser = sharedPreferences.getString(PrefProfile.uid).toString();
    });
    // getCart(idUser);
  }

  delete(String productId) {
    var result = firebaseDBServices().deleteProduct(productId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCart(String userId) {
    var result = firebaseDBServices().getMyCart(userId);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<Cart_screenCubit>(context);
    return BlocBuilder<Cart_screenCubit, Cart_screenState>(
      builder: (context, state) {
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: getCart(idUser),
            builder: (
              context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          snapshot.data!.docs.forEach((result) {
                            total +=
                                int.parse(result['total_price'].toString());
                            // print(total);
                            // cubit.showTotalPrice(total);
                          });
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                GestureDetector(
                                  // onTap: delete(snapshot.data!.docs[index].id),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: pinkStrongColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.delete,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 18, right: 18, bottom: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: whiteColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        "assets/images/image10.png",
                                        width: 95,
                                        height: 65,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['name_product'],
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'x${snapshot.data!.docs[index]['quantity']}',
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 14),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Rp. ${snapshot.data!.docs[index]['total_price']}',
                                            style: pinkBoldTextStyle.copyWith(
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      EditDetailScreen(
                                                        nameProduct: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ['name_product'],
                                                        harga: snapshot.data!
                                                                .docs[index]
                                                            ['price'],
                                                        quantity: snapshot.data!
                                                                .docs[index]
                                                            ['quantity'],
                                                        total_harga: snapshot
                                                                .data!
                                                                .docs[index]
                                                            ['total_price'],
                                                        pesananId: snapshot
                                                            .data!
                                                            .docs[index]
                                                            .reference
                                                            .id,
                                                      )));
                                        },
                                        child: Container(
                                          width: 52,
                                          height: 32,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Color(0xffF54749)),
                                          // ignore: prefer_const_constructors
                                          child: Center(
                                            child: const Text('Ubah',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xffFFFFFF))),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    PaymentWidget(
                      total_price: state.totalBayar,
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              }
            });
      },
    );
  }
}
