
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/layout/home_layout/cubit/state1_screen.dart';
import 'package:shop2/shared/Network/Local/cash_helper.dart';

class Cubit1 extends Cubit<state1> {
  Cubit1() : super(InetailState1());
  static Cubit1 get(context) => BlocProvider.of(context);
  bool isdark = true;
  void changAppMode({bool? fcromshared}) {
    if (fcromshared != null) {
      isdark = fcromshared;
    }
    CashHelper.PutData(key: 'isdark', value: isdark).then((value) {
      emit(ChangeDarkModeState1());
    });
    isdark = !isdark;
  }
}
