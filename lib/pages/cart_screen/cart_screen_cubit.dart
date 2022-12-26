import 'package:bloc/bloc.dart';

import 'cart_screen_state.dart';

class Cart_screenCubit extends Cubit<Cart_screenState> {
  Cart_screenCubit() : super(Cart_screenState());

  void showTotalPrice(int totalPrice) {
    emit(state.copyWith(
      totalBayar: totalPrice,
    ));
  }
}
