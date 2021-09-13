import 'package:flutter/material.dart';
import 'package:flutter_shop/myhomepagelogin.dart';
import 'package:flutter_shop/sharedperfarances.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'sharedperfarances.dart';

 class Screens{
   String image;
   String text;
   String title;

  Screens({
    required this.image,
    required this.text,
    required this.title
 });



 }

class OnBoarding_Screen extends StatefulWidget {

  @override
  _OnBoarding_ScreenState createState() => _OnBoarding_ScreenState();
}

class _OnBoarding_ScreenState extends State<OnBoarding_Screen> {
   List onboard=[
     Screens(image: 'assects/images/imageboard.png', text: 'Screen Text 1', title: 'Screen Title 1'),
     Screens(image: 'assects/images/imageboard.png', text: 'Screen Text 2', title: 'Screen Title 2'),
     Screens(image: 'assects/images/imageboard.png', text: 'Screen Text 3', title: 'Screen Title 3'),
   ];

   bool islast=false;

   var boardcontroler=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0.0,
          actions: [
            TextButton(onPressed: (){
              CasheHelper.savedata(key: 'Onboarding', value: true).then((value) {
                if(value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                    return Pagelogin();
                  })
                  );
                }

              } );
            }
            , child: Text('Skip',style: TextStyle(fontSize: 20),))
          ],
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==onboard.length-1)
                    {
                      setState(() {
                        islast=true;
                      });
                    }
                  else{
                    setState(() {
                      islast=false;
                    });
                  }

                },
                controller: boardcontroler,
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index)=> degin(onboard[index]),
                   itemCount: onboard.length,
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(controller: boardcontroler,
                    count: onboard.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4,
                      activeDotColor: Colors.blueAccent
                    ),

                ),
                Spacer(),
                FloatingActionButton(
                    child: Icon(Icons.arrow_forward_ios),
                    onPressed: (){
                      if(islast==true){
                        CasheHelper.savedata(key: 'Onboarding', value: true).then((value) {
                          if(value){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                              return Pagelogin();
                            })
                            );
                          }

                        } );
                      }
                      else{
                        boardcontroler.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn
                        );
                      }

                    })
              ],
            )
          ],
        ),
      )
    );
  }

  Widget degin(Screens model){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(height: 30,),
        Text('${model.title}',style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: 10,),
        Text('${model.text}',style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),),
      ],
    );
  }
}
