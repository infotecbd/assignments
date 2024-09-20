import 'package:flutter/material.dart';

import '../../style/style.dart';


class emailVarificationScreen extends StatefulWidget {
  const emailVarificationScreen({super.key});

  @override
  State<emailVarificationScreen> createState() => _emailVarificationScreenState();
}

class _emailVarificationScreenState extends State<emailVarificationScreen> {
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
                    Text("Enter Email Address", style: Head1Text(colorDarkBlue),),
                    SizedBox(height: 1,),
                    Text("A 6 Digit Pin Verfication will send to your email", style: Head6Text(colorDarkBlue),),

                    SizedBox(height: 20,),
                    TextFormField(decoration: AppInputDecoration("Email Address"),),


                    SizedBox(height: 20,),
                    Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Submit'),
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
