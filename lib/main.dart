import 'package:flutter/material.dart';
import 'package:responsive/Home_Screen/home_page.dart';

void main(){
  runApp(MyApp()); // Application
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: HomePage(),
    );
  }
}

