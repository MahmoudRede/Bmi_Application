import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/bloclogin//cubit.dart';
import 'package:flutter_shop/bloclogin//states.dart';
import 'package:flutter_shop/search.dart';


class LayoutHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=Appcubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: Text('Salla',style: TextStyle(color:  Color.fromRGBO(19, 21, 23  ,1 ),fontSize: 25,fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>
                 Search(),
                )
                );
              }, icon: Icon(Icons.search)),
            ],
          ),
          body: cubit.bottomscreen[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:  Color.fromRGBO(19, 21, 23  ,1 ),
            //20, 23, 26
            unselectedItemColor: Colors.blueGrey,
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentindex,
            onTap: (index){
              cubit.changeindex(index);
            },

            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Categroies',
                icon: Icon(Icons.apps_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Favorites',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        );
        },
    );
  }
}
