import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmi/result.dart';
import 'package:flutter_bmi/styles/colors.dart';
import 'package:flutter_bmi/styles/variables.dart';



class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {


  String result_body;

  String get text{
    String t;
    if(is_male==true){
      t='Male';
    }
    else if (is_male==false){
      t='Female';
    }
    return t;
  }

  String get image{
    String i;
    if(is_male==true){
      i='asscets/images/male-gender.png';
    }
    else if (is_male==false){
      i='asscets/images/female-sign.png';
    }
    return i;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar ----------------------------------------------
      appBar: AppBar(
        title: Text( 'BMI CALCULATOR',style: TextStyle(color:white,fontSize: 20,fontWeight: FontWeight.w800),),
        centerTitle: true,
        backgroundColor: red,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light
        ),
      ),

      // Body ----------------------------------------------

      body: Container(
        color: color_body,
        child: Column(
          children: [

            // Row Of Select Male Or Female---------------------------------

            Expanded(
              child: Container(
                  padding: EdgeInsets.all(padding_of_container),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              is_male=true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: is_male? red:white,
                              borderRadius: BorderRadius.circular(value_of_border_radies),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      width: width_of_image,
                                      height: height_of_image,
                                      image:
                                      AssetImage('asscets/images/male-gender.png')
                                  ),
                                  SizedBox(
                                    height: height_of_Sizedbox,
                                  ),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                        fontSize: text_fontsize, fontWeight: FontWeight.bold,color: Colors.black),
                                  ),

                                ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width_of_Sizedbox,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              is_male=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: is_male? white:red,
                              borderRadius: BorderRadius.circular(value_of_border_radies),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      width: width_of_image,
                                      height: height_of_image,
                                      image:
                                      AssetImage('asscets/images/female-sign.png')),
                                  SizedBox(
                                    height: height_of_Sizedbox,
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                        fontSize: text_fontsize, fontWeight: FontWeight.bold,color: Colors.black),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),

            // Row For Height ----------------------------------------------

            Expanded(
              child: Container(
                margin: EdgeInsets.all(margin_of_container),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(value_of_border_radies),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold,color: black),),
                    SizedBox(height: height_of_Sizedbox,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${hight_of_user.round()}',style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold,color: black),),
                        Text(' cm',style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold,color: black),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Slider(
                        activeColor: red,
                        value: hight_of_user , max:max_of_slider,min: min_of_slider , onChanged: (value){
                      setState(() {

                        hight_of_user=value;
                        t=hight_of_user.round();
                      });
                    })
                  ],
                ),
              ),
            ),

            // Row Of Weight and Age----------------------------------------------------


            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(value_of_border_radies),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('WEIGHT',style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold,color: black),),
                                SizedBox(height: height_of_Sizedbox,),
                                Text('$weight',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Expanded(
                                        child: FloatingActionButton(
                                          child: Icon(Icons.add),
                                          mini: true,
                                          heroTag: 'one',
                                          backgroundColor: red,
                                          onPressed: (){
                                            setState(() {
                                              weight++;
                                            });
                                          },
                                        )),
                                    SizedBox(width: 5,),
                                    Expanded(
                                        child: FloatingActionButton(
                                          child: Icon(Icons.remove),
                                          mini: true,
                                          heroTag: 'two',
                                          backgroundColor: red,
                                          onPressed: (){
                                            setState(() {
                                              weight--;
                                            });
                                          },
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(width: width_of_Sizedbox,)
                              ]
                          ),

                        ),
                      ),
                      SizedBox(width: width_of_Sizedbox,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(value_of_border_radies),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('AGE',style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold,color: black),),
                                SizedBox(height: 20,),
                                Text('$age',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Expanded(
                                        child: FloatingActionButton(
                                          child: Icon(Icons.add),
                                          mini: true,
                                          heroTag: 'three',
                                          backgroundColor: red,
                                          onPressed: (){
                                            setState(() {
                                              age++;
                                            });
                                          },
                                        )),
                                    SizedBox(width: width_of_Sizedbox,),
                                    Expanded(
                                        child: FloatingActionButton(
                                          child: Icon(Icons.remove),
                                          mini: true,
                                          backgroundColor: red,
                                          heroTag: 'four',
                                          onPressed: (){
                                            setState(() {
                                              age--;
                                            });
                                          },
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(width: width_of_Sizedbox,)
                              ]
                          ),

                        ),
                      ),
                    ],
                  )
              ),
            ),

            // Row Of Button----------------------------------------------------


            Container(
              width: double.infinity,
            height: height_of_button,
              child: RaisedButton(
                padding: EdgeInsets.all(padding_of_container),
                  child: Text('Calculate',style: TextStyle(color: black,fontSize: 20,fontWeight: FontWeight.bold),),
                  color: Colors.red,
                  onPressed: (){
                  setState(() {
                  double result= weight /pow(t/100, 2);

                    if(result<20){
                      result_body='Thin';
                    }
                    else if (result>30){
                      result_body='Fat';
                    }
                    else{
                      result_body='Normal';
                    }


                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Result(text:text , age: age,result: result.round(),image: image,body: result_body,);
                    }));
                  });
                  }
                  ),
            ),

          ],
        ),
      ),
    );
  }
}
