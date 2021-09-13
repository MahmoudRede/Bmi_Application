import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_testdahk/cubit/bloc.dart';
import 'package:flutter_testdahk/cubit/state.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>Appcubit(),
      child: BlocConsumer<Appcubit,Appstate>(
        builder: (context,state)=>  MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.teal,
            )
          ),
          darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.red,
            )
          ),
          themeMode: Appcubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
          home: MyHomePage(),
        ),
        listener: (context,state){},
      )
    );
  }
}
