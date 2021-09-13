import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taskapi/bloc/states.dart';
import 'package:flutter_taskapi/dio.dart';

import '../model.dart';

class Appcubit extends Cubit<Appstates>{
  Appcubit() : super(initstate());

  static Appcubit get(context)=>BlocProvider.of(context);

   Model ?model;

  void getdata(){
    emit(Loading());
    DioHelper.getdate(
        url:'https://ext-book.herokuapp.com/'
    ).then((value) {
       print(model!.STRTitle);
       emit(Sucess());
    }).catchError((error){
      print(error.toString());
      emit(Error());
    });
  }
}