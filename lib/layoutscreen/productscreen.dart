import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class MyResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return _buildMobileLayout();
        } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return _buildTabletLayout();
        } else {
          return _buildDesktopLayout();
        }
      },
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget> [
              Text("My Bag", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,),),

              SizedBox(height: 12.0,),

              Row(
                children: <Widget>[
                  Container(
                width: 80.00,
                height: 80.00,
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,

                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage("https://storage.apex4u.com/5680632b-2141-4cae-9060-09e0f52d5eb5.jpg")
                    ),
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                ),
              ),
              ),
                  SizedBox(width: 12.0,),
                  Expanded(child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Container(
                        width: 100,
                        child: Text(
                          "Nike Air Max Tailwind IV SP", style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Row(
                        children: <Widget>[ Container(
                          width: 20.0,
                          height: 20.0, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4.0),),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child:  Text("1", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4.0),),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15.0,
                            ),

                          ),
                          Spacer(),
                          Text("Tk.12000", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
                          ),
                          ),

                        ],

                      )


                    ],
                  ),
                  ) ],

              ),
            ],

          )

      ),
    );


  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("My Bag", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26.0,),),
          ],


        )

      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Desktop Layout'),
      ),
    );
  }
}

