
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news/bloc/state.dart';

class DioHelper  {

  static Dio dio;

  static init(){

    dio = Dio(
      BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError:   true,
      ),
    );
  }

  static Future<Response> getdata(
      @required String url,
       @required Map<String,dynamic> quary
      )async
  {
       return await  dio.get(url,queryParameters: quary);

  }
}