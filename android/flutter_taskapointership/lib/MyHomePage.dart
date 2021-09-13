import 'package:flutter/material.dart';

import 'api_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:  Container(
        child:Column(
          children: [
            Text(getData.toString()),
            RaisedButton(
                child: Text('Show Data'),
                onPressed: (){
                  setState(() {
                    getData();
                  });
                }),
          ],
        ),
      ),
    );
  }
}
