import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/bloc/cubit.dart';
import 'package:flutter_news/bloc/state.dart';
import 'package:flutter_news/dio.dart';
import 'package:flutter_news/homepage.dart';
import 'package:hexcolor/hexcolor.dart';


void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider
      (create: (BuildContext context) =>Newscubit()..get_business_data(),
      child: BlocConsumer <Newscubit,Appstates>(
        listener: (context,state){},
        builder: (context,state)=>
            MaterialApp(
          debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.black
                ),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),

                ),
              darkTheme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('333739'),
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.white
                ),
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: Newscubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: MyHomePage(),
        ),
      ),

    );
  }
}