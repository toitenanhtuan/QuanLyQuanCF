import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  var _appTheme = PrefUtils().getThemeData();

  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 26,
        space: 26,
        color: appTheme.black900,
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) =>
      TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 28.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 8.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w900,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 16.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w800,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 15.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),

      );
}

class ColorSchemes{
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF835F45),
    secondaryContainer: Color(0XFF6A462F),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF523420),
  );
}

class LightCodeColors {
  // Amber
  Color get amber200 => Color(0XFFFFDF85);
  Color get amber400 => Color(0XFFF8D317);
  Color get amber40001 => Color(0XFFFFCE31);

  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFCBCBD4);
  Color get blueGray10001 => Color(0XFFD9D9D9);

  // DeepOrange
  Color get deepOrange300 => Color(0XFFFE8668);

  // Deep Purple
  Color get deepPurple300 => Color(0XFF9E6EEB);
  Color get deepPurple400 => Color(0XFF7350AB);

  // Gray
  Color get gray300 => Color(0XFFE3D8D0);
  Color get gray400 => Color(0XFFCACACA);
  Color get gray50 => Color(0XFFF8F7FA);
  Color get gray500 => Color(0XFFA6A6AA);
  Color get gray50001 => Color(0XFF9D9797);
  Color get gray600 => Color(0XFF878585);
  Color get gray800 => Color(0XFF633F2C);
  Color get gray80001 => Color(0XFF3A3A3A);

  //Lime
  Color get lime800 => Color(0XFFA57939);
  Color get lime80001 => Color(0XFFB37B47);
  Color get lime900 => Color(0XFFA16745);
  Color get lime90001 => Color(0XFF8C5B3E);

  // Orange
  Color get orange400 => Color(0XFFFF9D33);

  //White
  Color get whiteA700 => Color(0XFFFDFDFD);
}