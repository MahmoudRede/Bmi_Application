import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/bloc/cubit.dart';
import 'package:flutter_news_app/bloc/states.dart';

import '../design.dart';

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,Appstates>(
      listener: (context,state){},
      builder: (context,state) {
        List list =CubitApp.get(context).sport;
        return ConditionalBuilder(
            condition: list.length>0,
            builder:(context)=> ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index) => design(list[index]),
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black,
                ) ,
                itemCount: list.length),
            fallback: (context)=> Center(child: CircularProgressIndicator()));},
    );
  }
}