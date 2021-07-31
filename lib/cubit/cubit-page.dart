import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech/cubit/cubit-state.dart';
import 'package:speech/moduels/business.dart';
import 'package:speech/moduels/science.dart';
import 'package:speech/moduels/sports.dart';
import 'package:speech/shared/network/dio.dart';

class CubitPage extends Cubit<CubitState> {
  CubitPage() : super(InitialStates());

  static CubitPage get(context) => BlocProvider.of(context);

  int currentScreen = 0;

  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];

  List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void changeScreen(int index) {
    currentScreen = index;
    emit(ChangeBottomNavigatorBarScreen());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(LoadingBusinessData());
    DioPage.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      //print(value.data['totalResults']);
      business = value.data['articles'];
      emit(GetBusinessData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorBusinessData(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(LoadingSportsData());
    DioPage.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      // print(value.data['totalResults']);
      sports = value.data['articles'];
      emit(GetSportsData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSportsData(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(LoadingScienceData());
    DioPage.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      print(value.data['totalResults']);
      science = value.data['articles'];
      emit(GetScienceData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorScienceData(error.toString()));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(LoadingSearchData());
    DioPage.getData(url: 'v2/top-headlines', query: {
      'q': '$value',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      //    print(value.data['totalResults']);
      search = value.data['articles'];
      emit(GetSearchData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearchData(error.toString()));
    });
  }
}
