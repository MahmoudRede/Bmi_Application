import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/bloc/cubit.dart';
import 'package:flutter_news/bloc/state.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,Appstates>(
        builder: (context,state) =>
            Container(
              alignment: Alignment.center,
              color: Newscubit.get(context).white,
              child: Text('Setting',style: TextStyle(fontSize: 25,color: Newscubit.get(context).black),),
            ) ,
        listener: (context,state) {});
  }
}
