import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/bloclogin//point.dart';
import 'package:flutter_shop/bloclogin//states.dart';
import 'package:flutter_shop/dio.dart';
import 'package:flutter_shop/modules/categoriesmodel.dart';
import 'package:flutter_shop/modules/favoritesmodel.dart';
import 'package:flutter_shop/modules/loginmodel.dart';
import 'package:flutter_shop/modules/shopmodel.dart';
import 'package:flutter_shop/screens/home.dart';
import 'package:flutter_shop/screens/favoirets.dart';
import 'package:flutter_shop/screens/categroie.dart';
import 'package:flutter_shop/screens/settings.dart';

class Appcubit extends Cubit<Appstates>{

  Appcubit() : super(initstate());

  static Appcubit get(context)=> BlocProvider.of(context);

  bool visibalty=true;

  late Loginmodel model;

  void icon_change(){

    visibalty=!visibalty;
    emit(changeicon());
  }

  void userlogin(
     String email,
     String password

      ){
    emit(Loadingloginstate());
    DioHelper.postdate( url:url,
     data: {
         'email':email,
         'password':password,
  }
    ).then((value) {
    model= Loginmodel.formJson(value.data);
    print(model.datal!.token);
    emit(Succesloginstate(model));
    }
    ).catchError((error){
      print(error.toString());
      emit(Errorloginstate(error()));
    });
  }

  var currentindex=0;

  List bottomscreen=[
    Products(),
    Categories(),
    Favoirets(),
    Settings(),
  ];


  void changeindex(index){
    currentindex=index;
    emit(Chnagebottomnavigtor());
  }


   HomeModel ?homeModel;
   Map <int,bool> favorites={};

  void getdatahomemodel(){
    emit(Loadingloginstateshop());
    DioHelper.getdate(

      url: urlhome,
      token: token,

    ).then((value) {
      homeModel=HomeModel.formJson(value.data);

      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id!:element.in_favorites!,
        });
      });
      print(favorites.toString());
      emit(Succesloginstateshop());

    }).catchError((error){
      print(error.toString());
      emit(Errorloginstateshop());
    });

  }

  CategoriesModel ?categoriesModel;

  void getcategories(){
    emit(LoadingCategoriesshop());
    DioHelper.getdate(

      url: urlcategories,
      token: token,

    ).then((value) {
      categoriesModel=CategoriesModel.formJson(value.data);


      emit(SuccesCategoriesshop());
    }).catchError((error){
      print(error.toString());
      emit(Errorloginstateshop());
    });

  }

  Loginmodel ?settingModel;

  void getsetting() {
    emit(LoadingSetting());
    DioHelper.getdate(
      url: urlsettings,
      token: token,

    ).then((value) {
      settingModel = Loginmodel.formJson(value.data);
      print(settingModel!.datal!.name);
      emit(SuccesSetting());
    }).catchError((error) {
      print(error.toString());
      emit(Errorloginstateshop());
    });
  }
    FavoriteModel ?favoriteModel;


  void changefavorite(int id){

    DioHelper.postdate(
        url: urlfavorites,
        data: {
          'product_id':id,
        },
        token: token,

    ).then((value) {
      favoriteModel=FavoriteModel.formJson(value.data);
      print(value.data);
      emit(SuccesFavoritesshop());
    }).catchError((error){
      print(error.toString());
    });

  }

  TextEditingController ?namecontroller = TextEditingController();
  TextEditingController ? emailcontroller = TextEditingController();
  TextEditingController ? phonecontroller = TextEditingController();
  void getcontroller(){
    namecontroller!.text=settingModel!.datal!.name;
    emailcontroller!.text=settingModel!.datal!.email;
    phonecontroller!.text=settingModel!.datal!.phone;
  }




}