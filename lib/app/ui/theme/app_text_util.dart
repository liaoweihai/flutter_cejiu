import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeaFont {
  static TextStyle s12FontTextStyle({Color? color}) {
    return sFontTextStyle(size: 12, color: color);
  }

  static TextStyle s13FontTextStyle({Color? color}) {
    return sFontTextStyle(size: 13, color: color);
  }

  static TextStyle s14FontTextStyle({Color? color}) {
    return sFontTextStyle(size: 14, color: color);
  }

  static TextStyle s15FontTextStyle({Color? color}) {
    return sFontTextStyle(size: 15, color: color);
  }

  static TextStyle s16FontTextStyle({Color? color}) {
    return sFontTextStyle(size: 16, color: color);
  }

  static TextStyle s18FontTextStyle({Color? color}) {
    return sFontTextStyle(size: 18, color: color);
  }

  static TextStyle s12BoldFontTextStyle({Color? color, bool? bold}) {
    return sFontTextStyle(size: 12, color: color, bold: true);
  }

  static TextStyle s13BoldFontTextStyle({Color? color, bool? bold}) {
    return sFontTextStyle(size: 13, color: color, bold: true);
  }

  static TextStyle s14BoldFontTextStyle({Color? color, bool? bold}) {
    return sFontTextStyle(size: 14, color: color, bold: true);
  }

  static TextStyle s15BoldFontTextStyle({Color? color, bool? bold}) {
    return sFontTextStyle(size: 15, color: color, bold: true);
  }

  static TextStyle s16BoldFontTextStyle({Color? color, bool? bold}) {
    return sFontTextStyle(size: 16, color: color, bold: true);
  }

  static TextStyle s18BoldFontTextStyle({Color? color, bool? bold}) {
    return sFontTextStyle(size: 18, color: color, bold: true);
  }

  static TextStyle sFontTextStyle({double? size, Color? color, bool? bold}) {
    return TextStyle(
        fontSize: size?.sp,
        color: color,
        fontWeight: bold == null
            ? FontWeight.normal
            : bold
                ? FontWeight.bold
                : FontWeight.normal);
  }
}
