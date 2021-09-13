import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/bloclogin//cubit.dart';
import 'package:flutter_shop/bloclogin//states.dart';
import 'package:flutter_shop/bloclogin/point.dart';
import 'package:flutter_shop/layouthome.dart';
import 'package:flutter_shop/rregister.dart';
import 'package:flutter_shop/sharedperfarances.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pagelogin extends StatelessWidget {
  var emailcontaner=TextEditingController();
  var passwordcontaner=TextEditingController();
  var key1=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
        listener: (context,state){
          if(state is Succesloginstate){
             if(state.model.status){
               Fluttertoast.showToast(
                   msg: state.model.message,
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.BOTTOM,
                   timeInSecForIosWeb: 5,
                   backgroundColor: Colors.green,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
                 CasheHelper.savedata(key: 'token', value: state.model.datal!.token).then((value) {
                   token=state.model.datal!.token;
                   Navigator.push(context, MaterialPageRoute(builder:(_){
                   return LayoutHome();
                 })
                 );
               });

             }
             else{
               Fluttertoast.showToast(
                   msg: state.model.message,
                   toastLength: Toast.LENGTH_SHORT,
                   gravity: ToastGravity.BOTTOM,
                   timeInSecForIosWeb: 4,
                   backgroundColor: Colors.red,
                   textColor: Colors.white,
                   fontSize: 16.0
               );             }
          }
        },
        builder: (context,state)=>Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(25),
                child: Form(
                  key: key1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LOGIN',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Login now to browse our hot offers',style: TextStyle(color: Colors.blueGrey,fontSize: 17),),
                      SizedBox(height: 40,),
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
                        controller: emailcontaner,
                        validator: (value){
                          if(value!.isEmpty)
                            return 'Please Enter Your Email';
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.blue),
                            suffixIcon:IconButton(
                              onPressed: (){
                                Appcubit.get(context).icon_change();
                              },
                              icon: Icon(
                                  Appcubit.get(context).visibalty?Icons.visibility_off:Icons.visibility,color: Colors.blue,
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                        ),
                        onFieldSubmitted: (value){
                          Appcubit.get(context).userlogin(emailcontaner.text, passwordcontaner.text);
                        },
                        keyboardType: TextInputType.number,
                        obscureText: Appcubit.get(context).visibalty,
                        controller: passwordcontaner,
                        validator: (String? value){
                          if(value!.isEmpty)
                            return 'Please Enter Your Password';
                        },
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 0, 10,0),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(15),
                            color:  Colors.blue,
                            child: Text('LOGIN',style: TextStyle(color: Colors.white,fontSize: 15),),
                            onPressed: (){
                              if(key1.currentState!.validate()){
                                Appcubit.get(context).userlogin(emailcontaner.text, passwordcontaner.text);
                              }
                            }

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',style: TextStyle(color: Colors.black,fontSize: 17),),
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder:(_){
                                  return Register();
                                }));
                              },
                              child: Text('REGISTER',style: TextStyle(color: Colors.blue,fontSize: 15),))
                        ],
                      )

                    ],
                  ),
                ),

              ),
            ),
          ),
        ),
      );

  }
}
