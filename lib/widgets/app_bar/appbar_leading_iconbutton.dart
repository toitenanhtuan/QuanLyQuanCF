import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton(
      {Key? key,
        this.imagePath,
        this.height,
        this.width,
        this.margin,
        this.onTap}) : super(key: key,);


  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: CustomIconButton(
          height: height ?? 36.h,
          width: width ?? 36.h,
          padding: EdgeInsets.all(8.h),
          decoration: InconButtonStyleHelper.fillGray,
          child: CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
          ),
        ),
      ),
    );
  }
}