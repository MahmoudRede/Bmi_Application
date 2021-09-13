import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/bloc/states.dart';
import 'package:flutter_news_app/layouts/business.dart';
import 'package:flutter_news_app/layouts/science.dart';
import 'package:flutter_news_app/layouts/settings.dart';
import 'package:flutter_news_app/layouts/sport.dart';

import '../dio_helper.dart';

class CubitApp extends Cubit<Appstates>{

  CubitApp() : super(intialappstate());

  static CubitApp get(context) => BlocProvider.of(context);

  int current_index=0;

List <Widget> layouts =[
  Business(),
  Sports(),
  Science(),
  Settings(),
];

  List  <BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      label: 'Business',
      icon: Icon(Icons.business_center_rounded,),
    ),
    BottomNavigationBarItem(
      label: 'Sports',
      icon: Icon(Icons.sports_baseball,),
    ),
    BottomNavigationBarItem(
      label: 'Apple',
      icon: Icon(Icons.app_blocking,),
    ),
    BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(Icons.settings,),
    ),

  ];

  void changebar(index){
    current_index=index;
    if(index==1){ get_sport_data();
    }
    else if(index==2){get_science_data();}
    emit(changenavigtorbar());
  }

  List <dynamic> business =[];

  void get_business_data(){
    emit(laudingGetBusinessstate());
    DioHelper.getdata('v2/top-headlines', {
      'country':'us','category':'business','apikey':'a14968dd10a44a7eb3efc08b870818ab'

      //'sources':'techcrunch','apikey':'a14968dd10a44a7eb3efc08b870818ab'
    }).then((value) {
      business=value.data['articles'];
      emit(GetBusinessstate());
    }
    ).catchError((error){
      print(error.toString());
      emit(errorGetBusinessstate());
    });

  }

  List <dynamic> science =[];

  void get_science_data(){
    emit(laudingGetsciencesstate());
    DioHelper.getdata('v2/top-headlines', {
    'q':'apple','from':'2021-06-29','sortBy':'publishedAt','apikey':'a14968dd10a44a7eb3efc08b870818ab'
    }).then((value) {
      science=value.data['articles'];
      emit(Getsciencestate());
    }
    ).catchError((error){
      print(error.toString());
      emit(errorGetsciencestate());
    });

  }

  List <dynamic> sport =[];


  void get_sport_data(){
    emit(laudingGetsportstate());
    DioHelper.getdata('v2/top-headlines', {
      'country':'eg','category':'sport','apikey':'a14968dd10a44a7eb3efc08b870818ab'
    }).then((value) {
      sport=value.data['articles'];
      emit(Getsportstate());
    }
    ).catchError((error){
      print(error.toString());
      emit(errorGetsportstate());
    });

  }

  bool isdart=false;

  void brightness(){

    isdart = isdart? false:true;
    emit(lightordart());

  }

}