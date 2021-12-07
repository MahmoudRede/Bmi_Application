import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/bloc/cubit.dart';
import 'package:flutter_news/bloc/state.dart';
import 'package:flutter_news/resubile.dart';

class Search extends StatelessWidget {

  Key Key1 = GlobalKey<FormState>();
  Color white= Colors.white;
  Color black=Color.fromRGBO(52, 51, 51, 1);
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<Newscubit,Appstates>(
        builder: (context,state){
          var list=Newscubit.get(context).search;
          return Scaffold(
            appBar: AppBar(
              title: Text('Search',style: TextStyle(color: Newscubit.get(context).b) ,
              ),
              elevation: 0.0,

              titleTextStyle: TextStyle(
                  color: black,fontSize: 20,fontWeight: FontWeight.bold
              ),
              iconTheme: IconThemeData(
                color: Newscubit.get(context).b,
              ),
          ),
            body: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(
                          color: Newscubit.get(context).b,
                  fontSize: 15,fontWeight: FontWeight.bold
            ),
                        decoration: InputDecoration(
                          labelText: "Search",
                          labelStyle: TextStyle(fontSize: 17,color: Newscubit.get(context).b),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Newscubit.get(context).b,width: 2)
                          ),
                        ),
                        onChanged: (value){
                          Newscubit.get(context).get_search_data(value);
                        },

                      ),
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context,index) => design(context,list[index]),
                            separatorBuilder: (context, index) => Container(
                              width: double.infinity,
                              height: 1,
                              color: Newscubit.get(context).b,
                            ) ,
                            itemCount: list.length),
                      ),
                    ],
                  )

                )
        );
        },
        listener: (context,state){},

    );
  }
}
