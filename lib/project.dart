

import 'package:flutter/material.dart';
import 'home1.dart';

class  Firstpage extends StatefulWidget{

  String h ="";
  Firstpage(this.h);
  @override
  State<Firstpage> createState() => _FirstpageState(this.h);
}

class _FirstpageState extends State<Firstpage> {
  bool male =true;
  double HIEGHT =0;
  int WIEGT =78;
  int AGE =19;
  String h ="";
  _FirstpageState(this.h);
  @override
  Widget build(BuildContext context) {

  return Scaffold(
    backgroundColor:Colors.black45,
      appBar:  AppBar(
        backgroundColor:Colors.black,
        title:const Center(child: Text("BMI Calculator"),),
      ),
      drawer: Drawer(),
    body:Container(


       child:Column(
       children: [
        Expanded(child:
        Row(


          children: [
            InkWell(
              onTap: (){
                setState(() {
                  male = false;
                });
              },
              child: Container(
                child: Column(
                  children: [
                   Image(image: AssetImage("assets/images/Vector.png"),height: 50,fit: BoxFit.cover,),
                    Text("Female", style: TextStyle(color:Colors.white,fontSize: 40,),textAlign: TextAlign.center, ),
                  ],
                ),
                width: 150,
                 height: 150,

                margin: EdgeInsets.only(left: 20, top: 10),
                decoration:  BoxDecoration(
                    color:(male == false)?Colors.pinkAccent:const Color(0xff1a1f38),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),




            InkWell(
              onTap: (){
                setState(() {
                  male=true;
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/mars.png"),height: 50 , fit: BoxFit.cover,),
                    Text("Male", style: TextStyle(color:Colors.white,fontSize: 40,),textAlign: TextAlign.center, ),
                  ],
                ),

                width: 150,
                height: 150,
                margin: EdgeInsets.only(left: 30, top: 10),
                decoration:  BoxDecoration(
                    color:(male == true)?Colors.blue:const Color(0xff1a1f38),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            )
          ],
  ),
        ),





        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Container(
            child:Column(
               children: [

                 Padding(
                   padding: const EdgeInsets.all(20),
                   child: Text("HIEGHT " , style: TextStyle(color:Colors.white,fontSize:25,),textAlign: TextAlign.center,),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: [
                   Text("${HIEGHT.round()} cm ",style: TextStyle(fontSize: 20,letterSpacing:2 , color: Colors.white),),

                 ],),


                 Padding(
                   padding:  EdgeInsets.only(top: 40),
                   child:
                   Slider(
                     min:0 ,
                     max:200 ,
                     value:HIEGHT ,
                     onChanged:(val){
                     setState(() {
                       HIEGHT=val;
                     });
                     } ,
                   ) ,
                 ),
               ],
            ),
            height:200 ,
            width: 350,
          margin:EdgeInsets.only(top: 30),
          decoration: const BoxDecoration(
              color:const Color(0xff1a1f38),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),




        ),
    ]
    ),





        Row(
          children: [
          Container(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Text("WIEGHT", style: TextStyle(color:Colors.white,fontSize:23,),textAlign: TextAlign.center, ),
               ),

               Row(mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.baseline,
                 textBaseline: TextBaseline.alphabetic,
                 children: [
                   Text("${WIEGT.round()}",style: TextStyle(fontSize: 20,letterSpacing:1.5 , color: Colors.white),),

                 ],),


               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   IconButton(onPressed:(){
                     setState(() {
                       WIEGT--;
                     });},icon:Icon(Icons.remove_circle,size: 40,),color: Colors.white,),


                   IconButton(onPressed: (){
                     setState(() {
                       WIEGT++;
                     });
                   },icon:Icon(Icons.add_circle,size: 40,),color: Colors.white,),

                 ],
               ),

             ],
           ),
              width: 150,
              height: 180,
              margin: EdgeInsets.only(left:30,top: 50),
              decoration: const BoxDecoration(

                color:const Color(0xff1a1f38),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
        ),



            Container(
              child: Column(
                children: [
                  Padding(child: Text("AGE", style: TextStyle(color:Colors.white,fontSize: 30,),textAlign: TextAlign.center,)
                  ,padding: EdgeInsets.all(20)
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("${AGE.round()}",style: TextStyle(fontSize: 20,letterSpacing: 1.5 , color: Colors.white),),
                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed:(){
                        setState(() {
                          AGE--;
                        });

                      }
                        ,icon:Icon(Icons.remove_circle,size: 40,),color: Colors.white,),

                      IconButton(onPressed: (){
                        setState(() {
                          AGE++;
                        });
                      },

                        icon:Icon(Icons.add_circle,size: 40,),color: Colors.white,),

                    ],),
                ],),
              width: 150,
              height: 180,
              margin: EdgeInsets.only(left:50,top: 50),
              decoration: const BoxDecoration(

                  color:const Color(0xff1a1f38),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),),
          ],),



        InkWell(
          onTap:(){
          Navigator.push(
              context,
             MaterialPageRoute(builder: (context){
                return Gameplay (HIEGHT ,WIEGT ,h);

              }
              )
          );
          },

          child: Container(
            width: 370,
            height:60 ,
            child:Text("CALCULATE",style: TextStyle(fontSize: 50,color: Colors.white),textAlign: TextAlign.center,),
            margin: EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
                color:const Color(0xfff10606),
                borderRadius: BorderRadius.all(Radius.circular(20))

            ),
          ),
        ),
      ],
    ) ,
    ),
    );
}
}
