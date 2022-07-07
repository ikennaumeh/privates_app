import 'package:flutter/material.dart';

class Palette {
  static const primary = Color(0xffE20F87);
  static const hintLightGrey = Color(0xFFE0E0E0);
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey10 = Color(0xff979797);
  static const transparent = Colors.transparent;
  static const grey = Colors.grey;
  static const lightBlue = Color(0xff262171);
  static const darkBlue = Color(0xff222B45);
  static const lightShadowGrey = Color.fromRGBO(0, 0, 0, 0.05);
  static const red = Colors.red;
  static  const buttonShadow = BoxShadow(
    color: lightShadowGrey,
    offset: Offset(0, 2.0),
    blurRadius: 2.0,
  );
}