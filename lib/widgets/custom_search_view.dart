import 'dart:math';

import 'package:appqlcafe/theme/custom_text_style.dart';
import 'package:appqlcafe/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../widgets/custom_image_view.dart';



class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
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
    this.validator,
    this.onChanged
  }) : super(key: key,);

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
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
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center,
        child: searchViewWidget(context))
        : searchViewWidget(context);
  }

  Widget searchViewWidget( BuildContext context) => Container(
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
      style: textStyle ?? CustomTextStyles.bodySmallBluegray100,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
      onChanged: (String value) {
        onChanged?.call(value);
      },
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.bodySmallBluegray100,
    prefixIcon: prefix ??
        Container(
          margin: EdgeInsets.fromLTRB(14.h, 12.h, 6.h, 12.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearch,
            height: 24.h,
            width: 24.h,
          ),
        ),
    prefixIconConstraints: prefixConstraints ??
        BoxConstraints(
          maxHeight: 50.h,
        ),
    suffixIcon: suffix ??
        Container(
          margin: EdgeInsets.fromLTRB(16.h, 12.h, 22.h, 12.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconparksettingconfig,
            height: 24.h,
            width: 24.h,
          ),
        ),
    suffixIconConstraints: suffixConstraints ??
        BoxConstraints(
          maxHeight: 50.h,
        ),
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(12.h),
    fillColor: fillColor ?? appTheme.gray50,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.h),
          borderSide: BorderSide(
            color: appTheme.blueGray100,
            width: 1,
          ),
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.h),
          borderSide: BorderSide(
            color: appTheme.blueGray100,
            width: 1,
          ),
        ),
    focusedBorder: (borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.h),
        ))
        .copyWith(
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
        width: 1,
      ),
    ),
  );
}