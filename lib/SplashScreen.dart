import 'dart:async';

import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
Timer(Duration(seconds: 2), (){

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SimpleCalculator()));
} );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       color:Colors.lightGreen,
           child: Column(

             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

            Center(   child: Text('Simple Cal',
              style: TextStyle(
                  fontSize: 32.4,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),

            ),
            ),
               Center(child:CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.cyan,
                  backgroundColor: Colors.black,
                ),

                )
             ],
           )
     ),
   );
  }
}



