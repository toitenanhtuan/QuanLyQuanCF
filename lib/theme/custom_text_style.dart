import 'package:appqlcafe/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}

class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLargeGray80001 =>
    theme.textTheme.bodyLarge!.copyWith(
      color: appTheme.gray80001,
    );
  static TextStyle get bodyLargeOnPrimary =>
    theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
  static TextStyle get bodyMediumBluegray10001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray10001,
        fontSize: 15.fSize,
      );
  static TextStyle get bodySmallBluegray100 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100,
      );
  static TextStyle get bodySmallGray50001 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50001,
        fontSize: 9.fSize,
      );
  static get bodySmallInter => theme.textTheme.bodySmall!.inter;
  static TextStyle get bodySmallLight =>
      theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodySmallLight_1 =>
      theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodySmall0nPrimary =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static TextStyle get bodySmall0nPrimaryLight =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 8.fSize,
        fontWeight: FontWeight.w300,
      );

  // Headline text style
  static TextStyle get headlineMediumBluegray100 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.blueGray100,
      );

  // Label text style
  static TextStyle get labelLargeBluegray100 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray100,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get labelLargeBluegray10001 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray10001,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get labelLargeExtraBold =>
      theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get labelLargeGray600 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelLargeGray80001 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get labelLargeInter =>
      theme.textTheme.labelLarge!.inter.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelLargeMedium =>
      theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelLargeOnPrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get labelLargeOnPrimaryMedium =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelLargePrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );

  // Lato text
  static TextStyle get latoBlack900 => TextStyle(
    color: appTheme.black900,
    fontSize: 6.fSize,
    fontWeight: FontWeight.w400,
  ).lato;

  // Title text style
  static TextStyle get titleLargeGray50 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray50,
      );
  static TextStyle get titleLargeOnPrimary =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static TextStyle get titleLargeOnPrimaryRegular =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleLargePrimary =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static TextStyle get titleLargeRegular =>
      theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleMediumBlack900 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get titleSmallBlack900 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallBluegray10001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray10001,
      );
  static TextStyle get titleSmallExtraBold =>
      theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
}