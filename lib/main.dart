
import 'package:bmi/Login.dart';
import 'package:flutter/material.dart';

import 'project.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
 @override
 Widget build(BuildContext context){
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:loginpage(),
    );
  }
}


