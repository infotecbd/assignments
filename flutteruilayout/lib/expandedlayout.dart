import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Stack & Expanded'),
        ),
        body: Column(
          children: <Widget>[
            // Expanded: takes up available space in a flexible manner
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Expanded 1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Expanded 2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Stack: overlays widgets on top of each other
            Stack(
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.red,
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.yellow,
                    child: Center(child: Text('On Top', style: TextStyle(color: Colors.black))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
