import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speech/cubit/cubitShare.dart';
import 'package:speech/home/home-page.dart';
import 'package:speech/shared/network/dio.dart';
import 'NeS/shearedpre.dart';
import 'cubit/cubit-observe.dart';
import 'cubit/cubit-page.dart';
import 'cubit/cubitsharestate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //for run all future method
  Bloc.observer =
      MyBlocObserver(); //to initialize Bloc.observer  to know where the code go and where i in any page
  DioPage.init(); // to initialize Dio for take data from link url
  await ChaHelper
      .init(); // to initialize shared_preferences if we want save any thing happened
  bool isDark = ChaHelper.getBoolD(
      key:
          'isDark'); //check if we change from light to dark and store the value in true or false
  runApp(Revision(
      isDark)); //here send to the class we run the value (isDark) to show what run dark or light
}

class Revision extends StatelessWidget {
  final isDark; //make value store in this value
  Revision(this.isDark); // take the value when any one call up take value

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //this for run many BlocProvider
      providers: [
        BlocProvider(
            create: (BuildContext
                    context) => //first BlocProvider to make the darkMode or lightMode
                CubitShareBl()..changeThem(fromShare: isDark)),
        BlocProvider(
          // second BlocProvider to run and get all data from getBusiness,getSports and getScience to put all data in right position
          create: (BuildContext context) => CubitPage()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        )
      ],
      child: BlocConsumer<CubitShareBl, CubitShareState>(
        //and take BlocConsumer that belong to dark BlocProvider to run dark-mode or light-mode
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: CubitShareBl.get(context).isDark
            //call up value from page to check if it dark or light to run mode
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
                )),// this mode for light mode
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
                )),// this mode for dark mode
            home: Home(), //now we go to home page
          );
        },
      ),
    );
  }
}
