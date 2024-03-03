import 'package:flutter/material.dart';
import 'package:lms/uttils/font_style.dart';

class chat extends StatelessWidget {
  const chat({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text(
          "Chat",
          style: Fontstyle.getHeading(screenWidth),
        ),
      ),
    );
  }
}
