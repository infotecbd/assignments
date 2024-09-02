import 'package:flutter/material.dart';

import '../Center Widgets/centered_view.dart';
import '../NavigationBar/nav_bar.dart';
import '../widgets/call_to_action.dart';
import '../widgets/course_details.dart';


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavBar(),
            Expanded(
              child: Row(
                children: <Widget>[
                  CourseDetails(),
                  Expanded(
                    child: Center(
                      child: CallToAction('Join Course'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}