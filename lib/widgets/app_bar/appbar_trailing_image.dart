import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../custom_image_view.dart';

class AppbarTrailingImage extends StatelessWidget {
  AppbarTrailingImage(
        {Key? key,
        this.imagePath,
        this.height,
        this.width,
        this.margin,
        this.onTap}) : super(key: key,);


  final double? height;
  final double? width;
  final String? imagePath;
  final String? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath!,
          height: height ?? 58.h,
          width: width ?? 58.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}