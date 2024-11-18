import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle robotoRegular({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color,
    );
TextStyle robotoMedium({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
    );
TextStyle robotoBold({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color,
    );
TextStyle robotoBlak({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w900,
      color: color,
    );
