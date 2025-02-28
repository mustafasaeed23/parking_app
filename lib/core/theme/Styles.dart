import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/core/theme/Colors.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  //
  return GoogleFonts.notoKufiArabic(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getBoldWhite15Style() {
  return _getTextStyle(
    20,
    FontWeight.bold,
    AppColors.whiteColor,
  );
}

TextStyle getMain16Style600() {
  return _getTextStyle(
    16,
    FontWeight.w600,
    AppColors.mainColor,
  );
}

TextStyle getMediumGrey13() {
  return _getTextStyle(
    13,
    FontWeight.w400,
    AppColors.greyColor,
  );
}
