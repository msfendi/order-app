import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptik_food/pages/detail_screen/detail_screen_view.dart';
import 'package:ptik_food/pages/home_screen/home_screen_cubit.dart';
import 'package:ptik_food/pages/home_screen/home_screen_state.dart';
import 'package:ptik_food/services/firebase_db_services.dart';

class ProductWidget extends StatefulWidget {
  final int idCategory;
  const ProductWidget({Key? key, this.idCategory = 1}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    var result = firebaseDBServices().getAllProducts();
    return result;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDataByCategory(int id) {
    var result = firebaseDBServices().getProductsByCategories(id);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<Home_screenCubit>(context);
    return BlocBuilder<Home_screenCubit, Home_screenState>(
      builder: (context, state) {
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: state.filter
              ? getDataByCategory(state.currentCategory)
              : getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 230,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 12, right: 12, bottom: 24),
                      width: 158,
                      height: 212,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/image8.png',
                                width: 136,
                                height: 91,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              snapshot.data!.docs[index]['name_product'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Rp. ${snapshot.data!.docs[index]['price'].toString()}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffF54749))),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Detail_screenPage(
                                                    nameProduct:
                                                        snapshot
                                                                    .data!.docs[
                                                                index]
                                                            ['name_product'],
                                                    deskripsi: snapshot
                                                            .data!.docs[index]
                                                        ['description'],
                                                    harga: snapshot.data!
                                                            .docs[index]
                                                        ['price'])));
                                  },
                                  child: Container(
                                    width: 52,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color(0xffF54749)),
                                    child: Center(
                                      child: Text('Beli',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xffFFFFFF))),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
    // : FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    //     future: getData(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return GridView.builder(
    //             physics: const NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             itemCount: snapshot.data!.docs.length,
    //             gridDelegate:
    //                 const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               mainAxisExtent: 230,
    //             ),
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 margin:
    //                     EdgeInsets.only(left: 12, right: 12, bottom: 24),
    //                 width: 158,
    //                 height: 212,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(32),
    //                     color: Colors.white),
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       horizontal: 11, vertical: 17),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       ClipRRect(
    //                         borderRadius: BorderRadius.circular(16),
    //                         child: Image.asset(
    //                           'assets/images/image8.png',
    //                           width: 136,
    //                           height: 91,
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         height: 8,
    //                       ),
    //                       Text(
    //                         snapshot.data!.docs[index]['name_product'],
    //                         style: TextStyle(
    //                             fontSize: 16, fontWeight: FontWeight.w600),
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment:
    //                             MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                               'Rp. ${snapshot.data!.docs[index]['price'].toString()}',
    //                               style: TextStyle(
    //                                   fontSize: 17,
    //                                   fontWeight: FontWeight.w700,
    //                                   color: Color(0xffF54749))),
    //                           Container(
    //                             width: 52,
    //                             height: 32,
    //                             decoration: BoxDecoration(
    //                                 borderRadius:
    //                                     BorderRadius.circular(100),
    //                                 color: Color(0xffF54749)),
    //                             child: Center(
    //                               child: Text('Beli',
    //                                   style: TextStyle(
    //                                       fontSize: 14,
    //                                       fontWeight: FontWeight.w700,
    //                                       color: Color(0xffFFFFFF))),
    //                             ),
    //                           )
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             });
    //       } else {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   );
  }
}
