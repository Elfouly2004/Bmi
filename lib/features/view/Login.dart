import 'package:bmi/features/view/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class loginpage extends StatefulWidget{
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String name="";
  GlobalKey<FormState>formkey=GlobalKey<FormState>();
  GlobalKey<FormState>formkey1=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
     body: SafeArea(
       child: SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 60),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
             Text("Sign Up",style: TextStyle( color: Colors.white,fontSize: 30,fontWeight:FontWeight.w500),)
             ],),

              SizedBox(height:80 ,),



                 Row(
                 children: [
                   Expanded(child:
                   Container(
                     height:80 ,
                     width:250 ,
                     decoration: BoxDecoration(
                       color:  Colors.white,
                       border: Border.all(color: Colors.deepOrangeAccent,width: 6),
                       borderRadius: BorderRadius.all(Radius.circular(20),),),

                     child: Column(
                       children: [

                         Form(
                           key:formkey,
                           child: TextFormField(
                            decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText:"Name" ,
                               hoverColor: Colors.white,),


                             onChanged: (value){
                              name=value;
                             },

                             validator:(value){
                              if(value!.isEmpty==true||value==null){
                                return"Should Write Name";
                              }
                              else{
                                return null;
                              }
                             },
                           ),
                         ),
                       ],
                     ),
                   ),
                   ),
                 ],
               ),


             SizedBox(height: 30,),


             Row(
               children: [
                 Expanded(child:
                 Container(
                   height:80 ,
                   width:250 ,
                   decoration: BoxDecoration(
                     color:  Colors.white,
                     border: Border.all(color: Colors.deepOrangeAccent,width: 6),
                     borderRadius: BorderRadius.all(Radius.circular(20),),),


                   child: Column(
                     children: [
                       Form(
                         key:formkey1,
                         child: TextFormField(
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             hintText: "Password",
                             hoverColor: Colors.white,),
                           validator: (value){
                             if(value!.isEmpty==true||value==null){
                               return"you should write password";}

                             else{return null;}
                           },

                         ),

                       ),
                     ],
                   ),
                 ),
                 ),
               ],
             ),


             InkWell(
         onTap:() {
              if(formkey.currentState!.validate()==true&&formkey1.currentState!.validate()==true){
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) {
                   return FirstPage(name);
                 }
                 )
             );
              }
              },


               child: Container(
                 width: 200,
                 height:60 ,
                 child:Text("Sign in",style: TextStyle(fontSize: 50,color: Colors.white),textAlign: TextAlign.center,),
                 margin: EdgeInsets.only(top: 50),
                 decoration: const BoxDecoration(
                     color:const Color(0xfff10606),
                     borderRadius: BorderRadius.all(Radius.circular(20))

                 ),
               ),


  )

           ],
         ),
       ),
     ),
    );
  }
}