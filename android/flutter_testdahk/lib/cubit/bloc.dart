

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testdahk/cubit/state.dart';

class Appcubit extends Cubit<Appstate>{
  Appcubit() : super(init());

  static Appcubit get(context) => BlocProvider.of(context);

  bool isDark=false;

  void changemode(){

    isDark=!isDark;
    emit(changemodetheme());
  }

}