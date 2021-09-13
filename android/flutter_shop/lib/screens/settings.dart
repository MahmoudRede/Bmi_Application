import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/bloclogin//cubit.dart';
import 'package:flutter_shop/bloclogin//states.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state){

    },
     builder: (context,state) {
         var cubit=Appcubit.get(context);
         return  Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child:Column(
              children: [
                RaisedButton(onPressed:(){
                    print(cubit.settingModel!.datal!.name);
                     },child: Text('Dahk'),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.blue,),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      )
                  ),
                  keyboardType: TextInputType.name,
                  controller:cubit.namecontroller,
                  validator: (value){
                    if(value!.isEmpty)
                      return 'Please Enter Your Name';
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.blue,),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      )
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller:cubit.emailcontroller,
                  validator: (value){
                    if(value!.isEmpty)
                      return 'Please Enter Your Email';
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone,color: Colors.blue,),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      )
                  ),
                  keyboardType: TextInputType.phone,
                  controller:cubit.phonecontroller,
                  validator: (value){
                    if(value!.isEmpty)
                      return 'Please Enter Your Phone';
                  },
                ),
                SizedBox(height: 20,),

              ],
            ),
          )
      );
    }
    );
  }
}
