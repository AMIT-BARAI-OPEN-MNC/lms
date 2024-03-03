import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/uttils/color.dart';

class ContainerDesigns {
  static BoxDecoration simpleContainer({
    Color color = Colors.white,
    double boxShadowBlurRadius = 0.0,
    Color boxShadowColor = Colors.transparent,
    Color? borderColor, // Optional border color
    double borderWidth = 0.0, // Optional border width
  }) {
    Color defaultBorderColor =
        color; // Set default border color to container color

    return BoxDecoration(
      color: color,
      border: borderColor != null
          ? Border.all(color: borderColor, width: borderWidth)
          : Border.all(color: defaultBorderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          blurRadius: boxShadowBlurRadius,
          color: boxShadowColor,
        ),
      ],
    );
  }

  static BoxDecoration gradientContainer({
    List<Color> gradientColors = const [Colors.blue, Colors.green],
    BorderRadius borderRadius = BorderRadius.zero,
    double boxShadowBlurRadius = 0.0,
    Color boxShadowColor = Colors.transparent,
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          blurRadius: boxShadowBlurRadius,
          color: boxShadowColor,
        ),
      ],
    );
  }

  // Add more container designs as needed
}
