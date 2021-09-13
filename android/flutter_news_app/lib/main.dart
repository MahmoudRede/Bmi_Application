import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/bloc/cubit.dart';
import 'package:flutter_news_app/bloc/states.dart';
import 'package:flutter_news_app/dio_helper.dart';
import 'package:flutter_news_app/screens.dart';
import 'package:flutter_news_app/style/colors.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitApp(),
      child:BlocConsumer <CubitApp,Appstates>(
        listener: (context,state){},
        builder: (context,state)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: white,
                elevation: 0.0,
                titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
              ),
              scaffoldBackgroundColor: white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange

              ),
              textTheme: TextTheme(
                bodyText1: (
                    TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(42, 39, 38, 1),
                    )
                ),
              )
          ),
          darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                iconTheme: IconThemeData(
                  color: Colors.white,

                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromARGB(42, 39, 38, 1),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color.fromARGB(42, 39, 38, 1),
                elevation: 0.0,
                titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
              ),
              scaffoldBackgroundColor: Color.fromARGB(42, 39, 38, 1),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: Color.fromARGB(42, 39, 38, 1),
                unselectedItemColor: Colors.grey,

              ),
              textTheme: TextTheme(
                bodyText1: (
                    TextStyle(
                        fontSize: 17,
                        color: Colors.white
                    )
                ),
              )
          ),
          themeMode: CubitApp.get(context).isdart? ThemeMode.light:ThemeMode.dark ,
          home: Screens(),
        ),
      ),
    );
  }
}

