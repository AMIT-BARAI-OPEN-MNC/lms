import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/uttils/color.dart';

class Fontstyle {
  static TextStyle getSubHeading(double screenWidth) {
    double fontSize = screenWidth * 0.05;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: subTextcolor,
    );
  }

  static TextStyle title(double screenWidth) {
    double fontSize = screenWidth * 0.05;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: blackBGcolor,
    );
  }

  static TextStyle SubTitle(double screenWidth) {
    double fontSize = screenWidth * 0.035;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: grey,
    );
  }

  static TextStyle getHeading(double screenWidth) {
    double fontSize = screenWidth * 0.08;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: blackBGcolor,
    );
  }

  static TextStyle getHeadingWhite(double screenWidth) {
    double fontSize = screenWidth * 0.08;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: white,
    );
  }

  // Add more text styles as needed
}
