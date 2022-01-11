import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// we in Dio to put like (URl) in this page to be able to get all data from url
class DioPage {
  static Dio dio; // first initialize Dio and take object from it (dio)

  static init() {
    //initialize first method that put on it the link(URL) to get all data
    dio = Dio(BaseOptions(
      //put inside the object that we took it from Dio BaseOption to put link in baseUrl
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true, //for receive error
    ));
  }

  static Future<Response> getData({
    //to get data
    @required
        String
            url, //put url that belong any page like ,Business or sport or science
    @required
        Map<String, dynamic> query, // to sore data as like map key and value
  }) async {
    return await dio.get(url,
        queryParameters: query); //this method to store what we took
  }
}
