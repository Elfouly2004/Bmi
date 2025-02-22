
import 'package:bmi/features/view/Login.dart';
import 'package:flutter/material.dart';

import 'features/view/project.dart';

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


