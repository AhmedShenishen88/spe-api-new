import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speech/cubit/cubitShare.dart';
import 'package:speech/home/home-page.dart';
import 'package:speech/shared/network/dio.dart';
import 'cubit/cubit-observe.dart';
import 'cubit/cubit-page.dart';
import 'cubit/cubitsharestate.dart';

void main() {
  runApp(Revision());
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioPage.init();
}

class Revision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CubitShareBl()),
        BlocProvider(
          create: (BuildContext context) => CubitPage()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        )
      ],
      child: BlocConsumer<CubitShareBl, CubitShareState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: CubitShareBl.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    backwardsCompatibility: false,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(color: Colors.black, size: 20),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                  elevation: 10.0,
                  type: BottomNavigationBarType.fixed,
                )),
            darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  elevation: 0.0,
                  backgroundColor: HexColor('333739'),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white, size: 20),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739'),
                  elevation: 10.0,
                  type: BottomNavigationBarType.fixed,
                )),
            home: Home(),
          );
        },
      ),
    );
  }
}
