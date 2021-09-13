import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taskapi/bloc/cubit.dart';
import 'package:flutter_taskapi/bloc/states.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>Appcubit()..getdata(),
      child: BlocConsumer<Appcubit,Appstates>(
        listener: (context,state){},
        builder: (context,state)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        ),
      )
    );
  }
}
