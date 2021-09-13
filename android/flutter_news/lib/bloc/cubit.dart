import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/bloc/colors.dart';
import 'package:flutter_news/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/screens/business.dart';
import 'package:flutter_news/screens/science.dart';
import 'package:flutter_news/screens/settings.dart';
import 'package:flutter_news/screens/sport.dart';

import '../dio.dart';

class Newscubit extends Cubit<Appstates>{

  Newscubit() : super(init());

  static Newscubit get(context) => BlocProvider.of(context);
  var current_index=0;


  List <BottomNavigationBarItem> bars =[
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
        label: 'Business',
    ),
    BottomNavigationBarItem(

      icon: Icon(Icons.sports_baseball),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),

  ];

    List layout=[
      Business(),
      Sports(),
      Science(),

    ];

  Color white= Colors.white;
  Color black=Color.fromRGBO(52, 51, 51, 1);
  var dark=Brightness.dark;
  var light=Brightness.light;


  void changebar(index){
    current_index=index;
    if(index==1){ get_sport_data();
    }
    else if(index==2){get_science_data();}
    emit(Change_bar());

  }


  List <dynamic> business =[];

  void get_business_data(){
    emit(lalodind_business());
    DioHelper.getdata('books/api/school/requests/StudentRequestPerSpec/', {
      'M':'1','C':'0','customer':'1','service':'F','apikey':'d49a8ff55c684fa99ba25e84bb6f14e3'

      //'country':'us','category':'business','apikey':'d49a8ff55c684fa99ba25e84bb6f14e3'

      //M=1&C=0&customer=1&service=F
    }).then((value) {
      business=value.data['Accept'];
      emit(get_business());
    }
    ).catchError((error){
      print(error.toString());
      emit(error_business());
    });

  }

  List <dynamic> science =[];

  void get_science_data(){
    emit(lalodind_science());
    DioHelper.getdata('v2/top-headlines', {
      'country':'us','category':'science','apikey':'d49a8ff55c684fa99ba25e84bb6f14e3'
    }).then((value) {
      science=value.data['articles'];
      emit(get_science());
    }
    ).catchError((error){
      print(error.toString());
      emit(error_science());
    });

  }

  List <dynamic> sport =[];


  void get_sport_data(){
    emit(lalodind_sport());
    DioHelper.getdata('v2/top-headlines', {
      'country':'us','category':'sport','apikey':'d49a8ff55c684fa99ba25e84bb6f14e3'
    }).then((value) {
      sport=value.data['articles'];
      emit(get_sport());
    }
    ).catchError((error){
      print(error.toString());
      emit(error_sport());
    });

  }

  List <dynamic> search =[];


  void get_search_data(String value){
    emit(lalodind_search());
    DioHelper.getdata('v2/everything', {
      'q':'$value','apikey':'d49a8ff55c684fa99ba25e84bb6f14e3'


    }).then((value) {
      search=value.data['articles'];
      emit(get_search());
    }
    ).catchError((error){
      print(error.toString());
      emit(error_search());
    });

  }

  bool isDark=false;

  void changemode(){

    isDark=!isDark;
    emit(changemodetheme());
  }

}