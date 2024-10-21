import 'package:appqlcafe/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Background decorations
  static BoxDecoration get backgroundGray20 => BoxDecoration(
    color: appTheme.gray50,
  );
  static BoxDecoration get backgroundWhite => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      )
    ],
  );

  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
    color: appTheme.black900,
  );
  static BoxDecoration get fillBlack900 => BoxDecoration(
    color: appTheme.black900.withOpacity(0.3),
  );
  static BoxDecoration get fillBlueGray => BoxDecoration (
    color: appTheme.blueGray10001,
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray500.withOpacity(0.21),
  );
  static BoxDecoration get fillonPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
  );

  //Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    border: Border.all(
      color: appTheme.black900,
      width: 1.h,
    ),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
            0,
            4,
        ),
      )
    ],
  );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    border: Border.all(
      color: appTheme.blueGray10001,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineGray => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    border: Border.all(
      color: appTheme.gray400,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineOnPrimary => BoxDecoration(
    color: appTheme.gray300,
    border: Border.all(
      color: theme.colorScheme.onPrimary,
      width: 1.h,
    ),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      )
    ],
  );

  // Product decorations
  static BoxDecoration get productCard => BoxDecoration(
    border: Border.all(
      color: theme.colorScheme.onPrimary,
      width: 1.h,
    ),
  );

  // Secondary decorations
  static BoxDecoration get secondaryBrown => BoxDecoration(
    color: theme.colorScheme.primary,
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      )
    ],
  );
}

class BorderRadiusStyle {

  // Circle borders
  static BorderRadius get circleBorder18 =>  BorderRadius.circular(
    18.h,
  );
  static BorderRadius get circleBorder22 => BorderRadius.circular(
    22.h,
  );
  static BorderRadius get circleBorder8 => BorderRadius.circular(
    8.h,
  );

  // Rounded borders
  static BorderRadius get roundedBorder14 => BorderRadius.circular(
    14.h,
  );
  static BorderRadius get roundedBorder26 => BorderRadius.circular(
    26.h,
  );
  static BorderRadius get roundedBorder34 => BorderRadius.circular(
    34.h,
  );
  static BorderRadius get roundedBorder40 => BorderRadius.circular(
    40.h,
  );
}