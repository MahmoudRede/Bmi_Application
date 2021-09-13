import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/bloc/cubit.dart';
import 'package:flutter_news_app/bloc/states.dart';
import 'package:flutter_news_app/dio_helper.dart';
import 'package:flutter_news_app/style/colors.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitApp()..get_business_data()..get_sport_data()..get_science_data(),
      child: BlocConsumer<CubitApp,Appstates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=CubitApp.get(context);
         return Scaffold(
          appBar: AppBar(
            title: Text('NewsApp',),
            actions: [
              IconButton(icon: Icon(Icons.brightness_4,), onPressed: (){
                CubitApp.get(context).brightness();
                print("${CubitApp.get(context).isdart}");
              }),
              IconButton(icon: Icon(Icons.search,), onPressed: (){}),

            ],
          ),
          body: cubit.layouts[cubit.current_index],
          bottomNavigationBar: BottomNavigationBar(
               currentIndex: cubit.current_index ,
                type: BottomNavigationBarType.fixed,
            items: cubit.items,
            onTap: (index){
                 cubit.changebar(index);
               },
          ),
        );
        }
      ),
    );
  }
}
