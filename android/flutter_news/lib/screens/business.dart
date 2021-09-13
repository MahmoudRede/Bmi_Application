import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/bloc/cubit.dart';
import 'package:flutter_news/bloc/state.dart';
import 'package:flutter_news/resubile.dart';


class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,Appstates>(
      listener: (context,state){},
      builder: (context,state) {
        List list =Newscubit.get(context).business;
        return ConditionalBuilder(
            condition: list.length>0,
            builder:(context)=> ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index) => design(context,list[index]),
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