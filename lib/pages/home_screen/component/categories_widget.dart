import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptik_food/pages/home_screen/home_screen_cubit.dart';
import 'package:ptik_food/services/firebase_db_services.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int? tappedIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    tappedIndex = 0;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    var result = firebaseDBServices().getCategory();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<Home_screenCubit>(context);
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 132,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          tappedIndex = index;
                        });
                        cubit.changeCurrentCategory(index);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 12, right: 12, bottom: 10),
                        width: 80,
                        height: 112,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: tappedIndex == index
                              ? Color(0xFFF54749)
                              : Color(0xFFF5F3F3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          child: Column(
                            children: [
                              Image.asset(
                                snapshot.data!.docs[index]['image'],
                                width: 60,
                                height: 65,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(snapshot.data!.docs[index]['name_category'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: tappedIndex == index
                                          ? Color(0xffFFFFFF)
                                          : Color(0xFF262626)))
                            ],
                          ),
                        ),
                      ),
                    );
                    // Container(
                    //   width: 100,
                    //   height: 132,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(32),
                    //       color: Color(0xffF54749)),
                    //   child: Column(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           // cubit.state.currentCategory = ;
                    //           // print(cubit.state.currentCategory);
                    //           cubit.state.filter = true;
                    //         },
                    //         child: Container(
                    //           height: 72,
                    //           width: 72,
                    //           child: Image.asset('assets/images/category1.png'),
                    //         ),
                    //       ),
                    //       Text(snapshot.data!.docs[index]['name_category']),
                    //     ],
                    //   ),
                    // );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}


 // ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //
              //   itemBuilder: (context, index) {
              //     return Container(
              //       width: 100,
              //       height: 132,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(32),
              //           color: Color(0xffF54749)),
              //       child: Column(
              //         children: [
              //           GestureDetector(
              //             onTap: () {
              //               // cubit.state.currentCategory = ;
              //               // print(cubit.state.currentCategory);
              //               cubit.state.filter = true;
              //             },
              //             child: Container(
              //               height: 72,
              //               width: 72,
              //               child: Image.asset('assets/images/category1.png'),
              //             ),
              //           ),
              //           Text(snapshot.data!.docs[index]['name_category']),
              //         ],
              //       ),
              //     );
              //   },
              // );
