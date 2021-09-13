import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bloc.dart';
import 'cubit/state.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstate>(
        builder: (context,state) =>  Scaffold(
          appBar: AppBar(
             actions: [
               IconButton(icon: Icon(Icons.brightness_4), onPressed: (){
                 Appcubit.get(context).changemode();
               })
             ],
          ),
          body: Container(
          ),
        ),
        listener: (context,state) {} );
  }
}
