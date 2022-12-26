import 'package:bloc/bloc.dart';

import 'login_screen_state.dart';

class Login_screenCubit extends Cubit<Login_screenState> {
  Login_screenCubit() : super(Login_screenState().init());
}
