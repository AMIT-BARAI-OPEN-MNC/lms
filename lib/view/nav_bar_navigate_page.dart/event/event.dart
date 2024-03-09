import 'package:flutter/material.dart';
import 'package:lms/uttils/font_style.dart';

class event extends StatelessWidget {
  const event({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text(
          "Events",
          style: Fontstyle.getHeading(screenWidth),
        ),
      ),
    );
  }
}
