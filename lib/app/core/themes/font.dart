import 'package:flutter/material.dart';

class Font {

  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  
  /*
    English fonts:
      - Heading: Poppins (Bold & semi bold)
      - Body: Inter (Bold & Regular)
  */
  static TextStyle poppins({
    double size = 16,
    FontWeight weight = semiBold,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: weight,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle inter({
    double size = 14,
    FontWeight weight = regular,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      fontWeight: weight,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }


  // ---------- English Heading ----------

  static TextStyle h1({double? size, FontWeight weight = FontWeight.bold, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      poppins(size: size ?? 36, weight: weight, color: color);

  static TextStyle h2({double? size, FontWeight weight = FontWeight.bold, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      poppins(size: size ?? 28, weight: weight, color: color);

  static TextStyle h3({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      poppins(size: size ?? 24, weight: weight, color: color);

  static TextStyle h4({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      poppins(size: size ?? 20, weight: weight, color: color);

  static TextStyle h5({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      poppins(size: size ?? 18, weight: weight, color: color);

  static TextStyle h6({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      poppins(size: size ?? 16, weight: weight, color: color);


  // ---------- English Body ----------
  static TextStyle interLarge({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      inter(size: size ?? 18, weight: weight, color: color);

  static TextStyle interMedium({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      inter(size: size ?? 16, weight: weight, color: color);

  static TextStyle interSmall({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      inter(size: size ?? 14, weight: weight, color: color);

  static TextStyle caption({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      inter(size: size ?? 12, weight: weight, color: color);

   /*
   
    Khmer fonts:
      - Heading: Kantumruy Pro (Bold & semi bold)
      - Body: Siem Reap (Bold & Regular)
      
  */
  static TextStyle kantumruyPro({
    required double size,
    FontWeight weight = regular,
    Color? color,
    TextDecoration? decoration, 
    Color? decorationColor
  }) {
    return TextStyle(
      fontFamily: 'KantumruyPro',
      fontSize: size,
      fontWeight: weight,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor
    );
  }

  static TextStyle siemreap({
    required double size,
    FontWeight weight = regular,
    Color? color,
    TextDecoration? decoration, 
    Color? decorationColor
  }) {
    return TextStyle(
      fontFamily: 'Siemreap',
      fontSize: size,
      fontWeight: weight,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor
    );
  }

  // ---------- Khmer Heading ----------

  static TextStyle khH1({double? size, FontWeight weight = FontWeight.bold, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      kantumruyPro(size: size ?? 36, weight: weight, color: color);

  static TextStyle khH2({double? size, FontWeight weight = FontWeight.bold, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      kantumruyPro(size: size ?? 28, weight: weight, color: color);

  static TextStyle khH3({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      kantumruyPro(size: size ?? 24, weight: weight, color: color);

  static TextStyle khH4({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      kantumruyPro(size: size ?? 20, weight: weight, color: color);

  static TextStyle khH5({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      kantumruyPro(size: size ?? 18, weight: weight, color: color);

  static TextStyle khH6({double? size, FontWeight weight = FontWeight.w600, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      kantumruyPro(size: size ?? 16, weight: weight, color: color);

  // ---------- KHMER BODY ----------

  static TextStyle siemreapLarge({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      siemreap(size: size ?? 18, weight: weight, color: color);

  static TextStyle siemreapMedium({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      siemreap(size: size ?? 16, weight: weight, color: color);

  static TextStyle siemreapSmall({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      siemreap(size: size ?? 14, weight: weight, color: color);

  static TextStyle siemreapCaption({double? size, FontWeight weight = FontWeight.w400, Color? color, TextDecoration? decoration, Color? decorationColor}) =>
      siemreap(size: size ?? 12, weight: weight, color: color);
}