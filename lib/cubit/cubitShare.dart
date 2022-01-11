import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech/NeS/shearedpre.dart';
import 'package:speech/cubit/cubitsharestate.dart';

//this cubit for control dark-mode
class CubitShareBl extends Cubit<CubitShareState> {
  CubitShareBl() : super(InitialScreenShare());
  static CubitShareBl get(context) => BlocProvider.of(context);

  bool isDark = false; //make element isDark and give him value = false
//hello
  void changeThem({bool fromShare}) {
    //this method for change from false to true or reverse
    if (fromShare != null) {
      //check first if the element don't has any value
      isDark = fromShare; //make is Dark equal fromShare
      emit(ChangeThemeScreen()); //to activation what happened
    } else {
      isDark = !isDark; // reverse value from false to true
      ChaHelper.putBoolD(key: 'isDark', value: isDark).then((value) {
        //here we save the value in ChaHelper to run we restart the app
        emit(ChangeThemeScreen());
      });
    }
  }
}
