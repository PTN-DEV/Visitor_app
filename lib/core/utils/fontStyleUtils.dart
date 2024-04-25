// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';

class FontStyleUtils {
  TextStyle getHeaderTextStyle(double fontSize) {
    return TextStyle(
      fontFamily: 'kanit',
      fontSize: fontSize,
      color: ColorPalette.blacke45,
    );
  }

  // TextStyle getSubjectTextStyle(double fontSize, Color color) {
  //   return TextStyle(
  //     fontFamily: 'kanit',
  //     fontSize: fontSize,
  //     color: color,
  //   );
  // }
}
