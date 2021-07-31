import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech/cubit/cubitsharestate.dart';

class CubitShareBl extends Cubit<CubitShareState> {
  CubitShareBl() : super(InitialScreenShare());
  static CubitShareBl get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeThem() {
    isDark = !isDark;
    emit(ChangeThemeScreen());
  }
}
