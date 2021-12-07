import 'package:flutter/material.dart';
import 'package:flutter_news/webview.dart';

import 'bloc/cubit.dart';

  Widget design(context,Map model){
  if(model['urlToImage']!=null){
    return
      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return WebViewscreen(url: model['url'],);
          }));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 130.0,
          child: Row(
            children: [
              Container(
                width: 130.0,
                height: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(model['urlToImage']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text(model['title'],style: TextStyle(fontSize: 17,color: Newscubit.get(context).b),maxLines: 3,overflow: TextOverflow.ellipsis,)),
                    SizedBox(height: 10,),
                    Text('${model['publishedAt']}',style: TextStyle(fontSize: 17,color: Newscubit.get(context).b)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

}