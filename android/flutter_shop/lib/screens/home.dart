import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/bloclogin//cubit.dart';
import 'package:flutter_shop/bloclogin//states.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=Appcubit.get(context);
          return Scaffold(
            backgroundColor:  Colors.grey[100],
            body: Container(
              child: cubit.homeModel!=null?
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       CarouselSlider(
                        items: cubit.homeModel!.data!.banners.map((e) =>
                            Image(
                              image: NetworkImage('${e.image}'),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                        ).toList()
                        ,options: CarouselOptions(
                        autoPlay: true,
                        initialPage: 0,
                        height: 250.0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal
                    )),
                       SizedBox(height: 20,),
                       Text('  CATEGORIES',style: TextStyle(color: Color.fromRGBO(19, 21, 23 ,1 ),fontSize: 25,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Container(
                         width: double.infinity,
                         height: 100,
                         child: ListView.separated(
                             physics: BouncingScrollPhysics(),
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context,index)=> Container(
                               clipBehavior: Clip.antiAliasWithSaveLayer,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   topRight: Radius.circular(20),
                                   topLeft: Radius.circular(20),
                                 ),
                                 color: Colors.white,
                               ),
                               child: Stack(
                                 alignment: Alignment.bottomCenter,
                                 children: [
                                   Container(
                                     height: 100,
                                     width: 100,
                                     child: Image(
                                       image:NetworkImage('${cubit.categoriesModel!.data!.data[index].image}'),
                                       fit: BoxFit.cover,
                                 ),
                                   ),
                                   Container(
                                       width: 100,
                                       color: Colors.black.withOpacity(.6),
                                       child: Text
                                         ('${cubit.categoriesModel!.data!.data[index].name}',
                                         style: TextStyle(color: Colors.white,),
                                       textAlign:TextAlign.center,)
                                   )
                                 ],
                               ),
                             ),
                             separatorBuilder: (context,index)=>SizedBox(width: 10,),
                             itemCount: cubit.categoriesModel!.data!.data.length,
                         ),
                       ),
                        SizedBox(height: 20,),
                        Text('  New Products',style: TextStyle(color: Color.fromRGBO(19, 21, 23 ,1 ),fontSize: 25,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                       Container(
                          color: Colors.grey[200],
                          child: GridView.count(
                            shrinkWrap:true ,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 1/1.7,
                            crossAxisCount: 2,
                            crossAxisSpacing:3,
                            mainAxisSpacing: 3,
                            children: List.generate
                            (
                                cubit.homeModel!.data!.products.length ,
                                (index) => Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Image(
                                            image: NetworkImage('${ cubit.homeModel!.data!.products[index].image}',),
                                            width: double.infinity,
                                            height: 200,
                                          ),
                                          if(cubit.homeModel!.data!.products[index].discount!=0)
                                            Text('DISCOUNT',style: TextStyle(
                                            backgroundColor: Colors.red,
                                            color: Colors.white
                                          ),)
                                        ],
                                      ),
                                      SizedBox(height: 8,),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text('${cubit.homeModel!.data!.products[index].name}',
                                          maxLines: 2,
                                          overflow:TextOverflow.ellipsis ,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Row(
                                            children: [
                                              Text('${cubit.homeModel!.data!.products[index].price}',style: TextStyle(color:  Color.fromRGBO(37, 102, 197 ,1 )),),
                                              SizedBox(width: 7,),
                                              if(cubit.homeModel!.data!.products[index].discount!=0)
                                              Text('${cubit.homeModel!.data!.products[index].old_price}',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  decoration: TextDecoration.lineThrough,
                                                )
                                                ,),
                                              Spacer(),
                                              IconButton(
                                                  onPressed: (){
                                                    cubit.changefavorite(cubit.homeModel!.data!.products[index].id!);
                                                  },
                                                  icon: CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: (cubit.favorites[cubit.homeModel!.data!.products[index].id!])! ? Colors.red:Colors.grey,
                                                    child: Icon
                                                      (
                                                        Icons.favorite_outline_rounded,
                                                      size: 18,
                                                      color: Colors.white,
                                                      ),
                                                  ),
                                              ),
                                            ],
                                          ),
                                      ),
                                    ],
                                  ),
                                )

                            ),
                          ),
                        ),

                  ],
                ),
              ):Center(
                child: CircularProgressIndicator(),
              )
            ),
          );
        }
    );
  }
}