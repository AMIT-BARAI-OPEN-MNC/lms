import 'package:flutter/material.dart';

const Color subTextcolor = Color.fromARGB(255, 96, 96, 96);
const Color blackBGcolor = Color.fromARGB(255, 20, 20, 25);
const Color buttonColor = Color(0xff3D5CFF);

const Color white = Color(0xffFFFFFF);
const Color backLightColor = Color(0xffFFFFF7);
const Color containerLightColor = Color(0xffEAEAFF);
const Color grey = Colors.grey;

const Color f = Color(0xff3D5CFF);

// This is for attendance progress indicator colour based on how much percentage
Color? getColor(double percentage) {
  // Calculate color based on percentage
  if (percentage <= 0.35) {
    return Color.lerp(Colors.red, Colors.green, percentage);
  } else {
    return Color.lerp(Colors.red, Colors.green, percentage + 0.35 * percentage);
  }
}
