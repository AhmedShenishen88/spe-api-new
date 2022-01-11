import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this page for save any value we want save
class ChaHelper {
  static SharedPreferences
      sharePs; // this for make object from SharedPreferences that name sharePS
  static init() async {
    sharePs = await SharedPreferences
        .getInstance(); //this method for initialize SharedPreferences
  }

  static Future<bool> putBoolD({
    //this method take key and put value that took from user to save on it
    @required String key,
    @required bool value,
  }) async {
    return await sharePs.setBool(key, value);
  }

  static bool getBoolD({
    //and this method to tell the main page in run what the user chosen
    @required String key,
  }) {
    return sharePs.getBool(key);
  }
}
