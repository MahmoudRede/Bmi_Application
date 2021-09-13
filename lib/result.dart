import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmi/bmi.dart';
import 'package:flutter_bmi/styles/colors.dart';
import 'package:flutter_bmi/styles/variables.dart';
import 'bmi.dart';
import 'dart:math';




class Result extends StatefulWidget {
  var image;
  var text;
  var result;
  var age;
  var body;
  Result({
    @required this. text,@required this.age,@required this.result,@required this.image,@required this.body
  });
  @override
  _ResultState createState() => _ResultState( text: this. text,age: this.age,result: this.result,image: this.image,body: this.body);
}

class _ResultState extends State<Result> {
  var image;
  var text;
  var result;
  var age;
  var body;

  _ResultState({
   @required this. text,@required this.age,this.result,@required this.image,@required this.body
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light
        ),
        title: Text('Result'),
      ),
      body:Container(
        color: color_body,
        width: double.infinity,
        padding: EdgeInsets.all(padding_of_container),
        child: Column(
          children: [

            // Row Of Show Kind----------------------------------------------------

            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(value_of_border_radies),
                color: white,

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image( width: width_of_image, height: height_of_image, image: AssetImage(image)),
                  SizedBox(height: height_of_Sizedbox,),
                  Text( text,style:TextStyle(fontSize: 25, fontWeight:FontWeight.bold,color: black),),
                ],
              ),
            )),

            SizedBox(height: height_of_Sizedbox),

            // Row Of Show Result----------------------------------------------------


            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(value_of_border_radies),
                color: white,

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Result',style:TextStyle(fontSize: 27 ,fontWeight:FontWeight.bold,color: red),),
                  SizedBox(height: 14,),
                  Text('BMI is = $result',style:TextStyle(fontSize: 22 ,fontWeight:FontWeight.bold,color: black),),
                  SizedBox(height: height_of_Sizedbox,),
                  Text(body,style:TextStyle(fontSize: 25 ,fontWeight:FontWeight.bold,color: black,),),
                ],
              ),
            )),
            SizedBox(height: height_of_Sizedbox,),

            // Row Of Show Age----------------------------------------------------

            Expanded(child: Container(
              padding: EdgeInsets.all(padding_of_container),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(value_of_border_radies),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Text('Age',style:TextStyle(fontSize: 27, fontWeight:FontWeight.bold,color: red),),
                  SizedBox(height: 30,),
                  Text('${age}',style:TextStyle(fontSize: 25, fontWeight:FontWeight.bold,color: black),),
                ],
              ),
            )),
            SizedBox(height: height_of_Sizedbox,),

            // Row For Button----------------------------------------------------


            Container(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(value_of_border_radies)
                ),
                padding: EdgeInsets.all(padding_of_container),
                  child: Text('Back',style: TextStyle(color: white,fontSize: 20,fontWeight: FontWeight.bold),),
                  color: Colors.blue,
                  onPressed: (){
                    setState(() {
                      Navigator.pop(context,Bmi());
                    });
                  }
                  ),
            ),

          ],
        ),
      ) ,
    );
  }
}
