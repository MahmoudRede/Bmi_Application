import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/dio.dart';
import 'package:flutter_shop/layouthome.dart';
import 'package:flutter_shop/onboarding.dart';
import 'package:flutter_shop/sharedperfarances.dart';
import 'bloclogin/point.dart';
import 'myhomepagelogin.dart';
import 'package:flutter_shop/bloclogin//cubit.dart';
import 'package:flutter_shop/bloclogin//states.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  late Widget widget;

  DioHelper.init();
  await CasheHelper.init();
   bool ?boarding=CasheHelper.get('Onboarding');
   token=CasheHelper.get('token');
   print(token);

   if(boarding!=null){
     if(token!=null){
       widget=LayoutHome();
     }
     else{
       widget=Pagelogin();
     }
   }
   else{
     widget=OnBoarding_Screen();
   }


  runApp(MyApp(
      wedgit: widget,
  ));
}

class MyApp extends StatelessWidget {
  late Widget wedgit;
  MyApp({
    required this.wedgit
});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Appcubit()..getdatahomemodel()..getcategories()..getsetting(),
      child: BlocConsumer< Appcubit, Appstates>(
       listener: (comtext,state){},
        builder: (context,state)=>MaterialApp(
          theme: ThemeData(
           bottomNavigationBarTheme: BottomNavigationBarThemeData(
             backgroundColor: Color.fromRGBO(250, 250, 250 , 1),
             elevation: 30
           ),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              iconTheme: IconThemeData(
                color:  Color.fromRGBO(19, 21, 23  ,1 ),
              ),
              elevation: 0.0,
              color: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),

            )
          ),
          debugShowCheckedModeBanner: false,
          home:wedgit,
        ),
      )
    );
  }
}
