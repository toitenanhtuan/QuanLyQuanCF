import 'package:appqlcafe/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';


extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray50,
    borderRadius: BorderRadius.circular(18.h),
  );
  static BoxDecoration get none => BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.height,
    this.width,
    this.alignment,
    this.onTap,
    this.decoration,
    this.padding,
    this.child}) : super(key: key);

  final double? height;
  final double? width;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return alignment != null
        ? Align(alignment: alignment ?? Alignment.center, child: iconButtonWidget)
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: DecoratedBox(
      decoration: decoration ??
          BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(14.h),
          ),
      child: IconButton(
        padding: padding ?? EdgeInsets.zero,
        onPressed: onTap,
        icon: child ?? Container(),
      ),
    ),
  );
}