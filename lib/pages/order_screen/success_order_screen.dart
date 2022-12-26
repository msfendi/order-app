import 'package:flutter/material.dart';
import 'package:ptik_food/pages/slider_page.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.all(4),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (builder) => const SliderPage()));
          },
        ),
        title: fontNunito("Pembayaranmu", 24, FontWeight.w600),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Image(
              image: AssetImage("assets/images/successful.png"),
              width: 211,
            ),
          ),
          Container(
            child: fontNunito("Pembayaranmu berhasil", 24, FontWeight.w700,
                height: 1.5),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
            child: fontNunito(
              "Terimakasih atas pesananya kawan, makananmu akan segera dibuat dan diantar oleh kurir",
              16,
              FontWeight.w500,
              height: 1.15,
              align: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFFEF0EB),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 22),
                      child: fontNunito('Proses', 20, FontWeight.w600,
                          height: 1.5, align: TextAlign.center),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 9),
                                child: fontNunito(
                                  'Dimasak',
                                  14,
                                  FontWeight.w500,
                                  color: Colors.white,
                                  height: 1.5,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(2),
                                primary: Color(0xFFF54749),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 9),
                                child: fontNunito(
                                  'Diantar',
                                  14,
                                  FontWeight.w500,
                                  color: Color(0xFFF54749),
                                  height: 1.5,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(2),
                                primary: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 9),
                                child: fontNunito(
                                  'Pesanan Sampai',
                                  14,
                                  FontWeight.w500,
                                  color: Color(0xFFF54749),
                                  height: 1.5,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(2),
                                primary: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: fontNunito(
                          "Silahkan menunggu makanan sampai dirumahmu...",
                          20,
                          FontWeight.w600,
                          height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Text fontNunito(String teks, double size, FontWeight weight,
      {Color color = Colors.black,
      double height = 0,
      TextAlign align = TextAlign.left}) {
    return Text(
      teks,
      textAlign: align,
      style:
          // GoogleFonts.nunito(
          //   textStyle:
          TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: height,
      ),
      // ),
    );
  }
}
