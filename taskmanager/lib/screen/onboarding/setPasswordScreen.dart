import 'package:flutter/material.dart';

import '../../style/style.dart';


class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children : [
            ScreenBackground(context),
            Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set New Password", style: Head1Text(colorDarkBlue),),
                    SizedBox(height: 1,),
                    Text("Letters and Numuric Combination", style: Head6Text(colorDarkBlue),),

                    SizedBox(height: 20,),
                    TextFormField(decoration: AppInputDecoration("Set New Password"),),

                    SizedBox(height: 20,),
                    TextFormField(decoration: AppInputDecoration("Confirm New Password"),),


                    SizedBox(height: 20,),
                    Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Login'),
                        onPressed: (){

                        },
                      ),
                    )


                  ],
                )
            )
          ]
      ),
    );
  }
}
