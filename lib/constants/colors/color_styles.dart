import 'package:flutter/material.dart';
const Map<int, Color> color =
{
  50:Color.fromRGBO(254, 63, 64, .1),
  100:Color.fromRGBO(254, 63, 64, .2),
  200:Color.fromRGBO(254, 63, 64, .3),
  300:Color.fromRGBO(254, 63, 64, .4),
  400:Color.fromRGBO(254, 63, 64, .5),
  500:Color.fromRGBO(254, 63, 64, .6),
  600:Color.fromRGBO(254, 63, 64, .7),
  700:Color.fromRGBO(254, 63, 64, .8),
  800:Color.fromRGBO(254, 63, 64, .9),
  900:Color.fromRGBO(254, 63, 64, 1),
};
class ColorStyles {
  static const primary = Color(0xFFFE3F40);
  static const primarySwath = MaterialColor(0xFFFE3F40, color);
  static const black = Color(0xFF333333);
  static const grey888 = Color(0xFF888888);
  static const white = Color(0xFFFFFFFF);
  static const redAccent = Color(0xFFD7270F);
  static const yellow = Color(0xFFFFA800);
  static const diamond = Color(0xFF00C3FF);
}