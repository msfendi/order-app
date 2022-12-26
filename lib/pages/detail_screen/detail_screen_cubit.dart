import 'package:bloc/bloc.dart';

import 'detail_screen_state.dart';

class Detail_screenCubit extends Cubit<Detail_screenState> {
  Detail_screenCubit() : super(Detail_screenState().init());
}
