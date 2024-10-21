import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../theme/theme_helper.dart';


class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
      backgroundColor: appTheme.blueGray10001,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.h), ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.h),
      ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get fillPrimaryTL14 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get fillPrimaryTL4 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  // text button style
  static ButtonStyle get none => ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      elevation: WidgetStateProperty.all<double>(0),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(color: Colors.transparent),
      ));
}