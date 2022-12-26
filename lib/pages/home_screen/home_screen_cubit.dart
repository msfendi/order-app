import 'package:bloc/bloc.dart';

import 'home_screen_state.dart';

class Home_screenCubit extends Cubit<Home_screenState> {
  Home_screenCubit() : super(Home_screenState());

  void changeCurrentCategory(int idCategory) {
    emit(state.copyWith(currentCategory: idCategory, filter: true));
  }
}
