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

  int currentScreen =
      0; //first this value that can help us to control the screens

  List<Widget> screens = [
    //this list include all screens
    Business(),
    Sports(),
    Science(),
  ];

  List<BottomNavigationBarItem> item = [
    //this list has the value of bottomNavigationBar
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void changeScreen(int index) {
    //this method for change BottomNavigationBar
    currentScreen = index;
    emit(ChangeBottomNavigatorBarScreen());
  }

  List<dynamic> business = [];
  //first list put data we find it in list that name business
  void getBusiness() {
    //first method to get data that belong to business
    emit(
        LoadingBusinessData()); //loading page to wait data because maybe take a long time
    DioPage.getData(
        //call up the method in Dio page the get data
        url: 'v2/top-headlines',
        // this url that take from it data
        query: {
          'country':
              'us', //give to use country eg egypt us united state if we change get data belong to the country
          'category': 'business', // we chose get data about business
          'apikey':
              '65f7f556ec76449fa7dc7c0069f040ca', //apikey take from url that belong to business
        }).then((value) {
      //value has all data
      //print(value.data['totalResults']);
      business =
          value.data['articles']; // to take articles that to about business
      emit(GetBusinessData()); //this step import to activation. what did you do
    }).catchError((error) {
      print(error.toString());
      //this step for if error happened to see it to solve it
      emit(ErrorBusinessData(error.toString()));
    });
  }

  List<dynamic> sports = [];
  //here like all business but we must change category to science to get data belong to sport
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
  //here like all business but we must change category to science to get data belong to science
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
  // now we here in search method
  void getSearch(String value) {
    emit(LoadingSearchData());
    DioPage.getData(url: 'v2/top-headlines', query: {
      'q':
          '$value', //change if we write in world search value about like "s ,size ..etc"
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
