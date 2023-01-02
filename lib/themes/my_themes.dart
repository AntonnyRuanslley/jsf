import 'package:flutter/material.dart';

abstract class MyThemes {
  static MyThemes of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color terciaryColor;
  late Color background;
  late Color primaryText;
  late Color secondaryText;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends MyThemes {
  late Color primaryColor = const Color(0xFF8A2387);
  late Color secondaryColor = const Color(0xFFF27121);
  late Color terciaryColor = const Color(0xFFF1F4F8);
  late Color background = const Color(0xFFF3D5DB);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF57636C);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final MyThemes theme;

  String get title1Family => 'OpenSans';
  TextStyle get title1 => TextStyle(
        color: theme.primaryText,
        fontFamily: "OpenSans",
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );
  String get title2Family => 'OpenSans';
  TextStyle get title2 => TextStyle(
        color: theme.primaryText,
        fontFamily: "OpenSans",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  String get subtitle1Family => 'OpenSans';
  TextStyle get subtitle1 => TextStyle(
        color: theme.primaryText,
        fontFamily: "OpenSans",
        fontSize: 18,
        fontWeight: FontWeight.normal,
      );
  String get subtitle2Family => 'OpenSans';
  TextStyle get subtitle2 => TextStyle(
        color: theme.primaryText,
        fontFamily: "OpenSans",
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );
  String get bodyText1Family => 'OpenSans';
  TextStyle get bodyText1 => TextStyle(
        color: theme.primaryText,
        fontFamily: "OpenSans",
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );
  String get bodyText2Family => 'OpenSans';
  TextStyle get bodyText2 => TextStyle(
        color: theme.primaryText,
        fontFamily: "OpenSans",
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      // useGoogleFonts
      // ? GoogleFonts.getFont(
      //     fontFamily!,
      //     color: color ?? this.color,
      //     fontSize: fontSize ?? this.fontSize,
      //     letterSpacing: letterSpacing ?? this.letterSpacing,
      //     fontWeight: fontWeight ?? this.fontWeight,
      //     fontStyle: fontStyle ?? this.fontStyle,
      //     decoration: decoration,
      //     height: lineHeight,
      //   )
      /* :*/ copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}
