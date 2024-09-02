import 'package:flutter/cupertino.dart';

class NavbarLeft extends StatelessWidget {
  const NavbarLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: Image.asset('asset/logo.png'),
    );

  }
}
