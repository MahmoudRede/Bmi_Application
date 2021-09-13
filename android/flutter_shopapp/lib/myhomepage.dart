import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  bool visibality=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 185, 64, 1),
      appBar:AppBar(
        backgroundColor:Color.fromRGBO(248, 185, 64, 1) ,
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light
        ),
      ) ,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          width: double.infinity,
          child: Form(
            child: Column(
              children: [
                Container(
                    child: Image.asset("assects/images/icons8-buy-100.png",)
                ),
                Text('Buy It',
                  style: TextStyle(
                      color: Color.fromRGBO(32, 30, 26, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.fromLTRB(27, 20, 27, 13),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      prefixIcon: Icon(Icons.email,color: Color.fromRGBO(248, 185, 64, 1),),
                      filled: true,
                      fillColor: Color.fromRGBO(230, 223, 210, 1),
                      hintStyle: TextStyle(fontSize: 18,color: Color.fromRGBO(107, 79, 26, .6),fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(27, 0, 27, 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: (){

                        },
                      ),
                      fillColor: Color.fromRGBO(230, 223, 210, 1),
                      hintStyle: TextStyle(fontSize: 18,color: Color.fromRGBO(107, 79, 26, .6),fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 120,
                  height: 50,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 16),),
                      color: Colors.black,
                      onPressed: (){}
                      ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account ?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    Text(' Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),

                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
