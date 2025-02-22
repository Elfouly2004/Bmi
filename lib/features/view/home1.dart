
import 'dart:math';

import 'package:flutter/material.dart';

class Gameplay extends StatelessWidget{
  double h=0;
   int w=0;
  String m="";
  double bmi=0;
  Color fontColor = Colors.green;

  Gameplay(this.h,this.w,this.m);

   String calculate(){
  bmi=w/ pow(h.round()/100,2);

  if(bmi < 15){
    fontColor = Colors.orange;
    return "Very severely underweight";
  }
  else if(bmi>=15 && bmi<16){
    fontColor = Colors.orange;
    return "Severely underweight";
  }
  else if(bmi>=16 && bmi <18.5){
    fontColor = Colors.orange;
    return "Underweight";
  }
  else if(bmi>=18.5 && bmi <25){
    fontColor = Colors.green;
    return "Normal";
  }
  else if(bmi>=25 && bmi<30){
    fontColor = Colors.orange;
    return "Overweight";
  }
  else if(bmi >=30 && bmi < 35){
    fontColor = Colors.red;
    return "Moderately obese";
  }
  else if(bmi>=35 && bmi <40){
    fontColor = Colors.red;
    return "Severely obese";
  }
  else {
    fontColor = Colors.red;
    return "Very Severely obese";
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.black,
    appBar: AppBar(
      backgroundColor:Colors.black,
    ),
    body:SafeArea(
    child: Column(

    children: [
      Row(
        children: [
          Text("${m} result",style: TextStyle(color:const Color(0xffffffff),fontSize: 40 ),)
        ],
      ),

      SizedBox(height: 40,),

      Container(
        width: double.infinity,
        height: 530,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF1A1F38),
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              calculate(),
          style: TextStyle(
          color: fontColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5),),
            
            SizedBox(height: 90,),

            Text(
              "${bmi.round()}",
              style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 1.5
              ),
            ),

        ],
      ),



      )



    ]
    ),
    ),
    
    );
    }
}

