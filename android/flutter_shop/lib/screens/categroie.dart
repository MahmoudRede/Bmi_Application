import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/bloclogin//cubit.dart';
import 'package:flutter_shop/bloclogin//states.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=Appcubit.get(context);
        return Scaffold(
          body:  Container(
            color: Colors.white,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
                     itemBuilder: (context,index)=>Container(
                       padding: EdgeInsets.all(20),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Container(
                             height: 100,
                             width: 100,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 image: DecorationImage(
                                   image: NetworkImage('${cubit.categoriesModel!.data!.data[index].image}'),
                                   fit: BoxFit.cover,
                                 )
                             ),
                           ),
                           SizedBox(width: 30,),
                           Text('${cubit.categoriesModel!.data!.data[index].name}',style: TextStyle(fontSize: 20),),
                           Spacer(),
                           IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
                            SizedBox(height: 100,),
                         ],
                       ),
                     ),
                     separatorBuilder: (context,index)=>
                        Container(
                         margin: EdgeInsets.fromLTRB(20,10,20,0),
                         color:  Color.fromRGBO(19, 21, 23 , 1),
                          height: 1,
                        ),

                     itemCount: 10),
          ),
            );
    }
    );
  }
}