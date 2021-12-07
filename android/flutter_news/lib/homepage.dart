import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/bloc/cubit.dart';
import 'package:flutter_news/bloc/state.dart';
import 'package:flutter_news/dio.dart';
import 'package:flutter_news/search.dart';


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,Appstates>(
      listener: (context,state){},
      builder: (context,state)=> Scaffold(
        appBar: AppBar(
          title: Text('News'),
          actions: [
            IconButton(icon: Icon(Icons.brightness_4), onPressed: (){
              Newscubit.get(context).changemode();
            }),
            IconButton(icon: Icon(Icons.search), onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return Search();
              }));
            }),
          ],


        ),
        body: Newscubit.get(context).layout[Newscubit.get(context).current_index],
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: Newscubit.get(context).current_index,
          onTap: (index){
            Newscubit.get(context).changebar(index);
          },
          type: BottomNavigationBarType.fixed,
          items: Newscubit.get(context).bars,
        ),
      ),
    ) ;
  }
}
