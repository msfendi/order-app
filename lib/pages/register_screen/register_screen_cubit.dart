import 'package:bloc/bloc.dart';

import 'register_screen_state.dart';

class Register_screenCubit extends Cubit<Register_screenState> {
  Register_screenCubit() : super(Register_screenState().init());
}
