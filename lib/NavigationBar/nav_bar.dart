import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive/NavigationBar/navbar_left.dart';
import 'package:responsive/NavigationBar/navbar_tab_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive/NavigationBar/navbar_mobile.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavbarMobile(),
      tablet: NavbarTabDesktop(),
    );
  }
}
//     return Container(
//       height: 100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           SizedBox(
//             height: 80,
//             width: 150,
//             child: Image.asset('assets/logo.png'),
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               _NavBarItem('Episodes'),
//               SizedBox(
//                 width: 60,
//               ),
//               _NavBarItem('About'),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class _NavBarItem extends StatelessWidget {
//     final String title;
//     const _NavBarItem(this.title);
//
//   @override
//   Widget build(BuildContext context) {
//       return Text( title,
//           style: TextStyle(fontSize: 20),
//     );
//   }
// }
