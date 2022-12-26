// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptik_food/pages/cart_screen/cart_screen_cubit.dart';
import 'package:ptik_food/pages/order_screen/success_order_screen.dart';
import 'package:ptik_food/style.dart';

class PaymentWidget extends StatefulWidget {
  final int total_price;
  const PaymentWidget({Key? key, required this.total_price}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late String _selected;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<Cart_screenCubit>(context);
    return Container(
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pembayaran",
              style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 14,
            ),
            Divider(
              color: grayColor,
              height: 8,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pembayaran :",
                  style: blackSemiBoldTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Rp. ${widget.total_price}',
                  style: pinkBoldTextStyle.copyWith(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Kamu mau bayar pake apa?",
              style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // addToCart(widget.nameProduct, widget.harga, dataHarga,
                    //     quantity, idUser);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const SuccessOrder()));
                  },
                  child: Text('Konfirmasi Pesanan',
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
