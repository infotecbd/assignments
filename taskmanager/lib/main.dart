import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVarificationScreen.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override

  Widget build (BuildContext context){
    return MaterialApp(
      title: "Task Management",

      initialRoute: '/pinVerification',
      routes: {
        '/' : (context)=>splashScreen(),
        '/login' : (context)=>loginScreen(),
        '/registration' : (context)=>registrationScreen(),
        '/emailVerification' : (context)=>emailVarificationScreen(),
        '/pinVerification' : (context)=>pinVerificationScreen(),
        '/setPassword' : (context)=>setPasswordScreen(),

      },
    );
  }
}