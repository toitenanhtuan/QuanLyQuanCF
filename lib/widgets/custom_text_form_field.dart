import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:appqlcafe/theme/custom_text_style.dart';
import 'package:appqlcafe/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';


extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillWhiteA => OutlineInputBorder(
    borderRadius: BorderRadius.circular(24.h),
    borderSide: BorderSide.none,
  );
  static OutlineInputBorder get fillOnPrimary => OutlineInputBorder(
    borderRadius: BorderRadius.circular(24.h),
    borderSide: BorderSide.none,
  );
}



class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator
  }) : super(key: key,);

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context))
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget( BuildContext context) => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: TextFormField(
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      autofocus: autofocus!,
      style: textStyle ?? CustomTextStyles.titleLargeRegular,
      obscureText: obscureText!,
      readOnly: readOnly!,
      onTap: () {
        onTap?.call();
      },
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.titleSmallBluegray10001,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding:
      contentPadding ?? EdgeInsets.fromLTRB(12.h, 18.h, 12.h, 12.h),
    fillColor: fillColor ?? theme.colorScheme.onPrimary,
    filled: filled,
    border: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.h),
        borderSide: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
      ),
    enabledBorder: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.h),
        borderSide: BorderSide(
          color: appTheme.black900,
          width: 1,
        ),
      ),
    focusedBorder: (borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.h),
        ))
      .copyWith(
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
        width: 1,
      ),
    ),
  );
}