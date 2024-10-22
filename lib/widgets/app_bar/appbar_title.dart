import 'package:appqlcafe/theme/custom_text_style.dart';
import 'package:appqlcafe/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarTitle extends StatelessWidget {
  AppbarTitle({Key? key, required this.text, this.onTap, this.margin})
      : super(
          key: key,
        );


  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: margin ?? EdgeInsets.zero,
        child: GestureDetector(
          onTap: (){
            onTap?.call();
          },
          child: Text(
            text,
            style: CustomTextStyles.labelLargeExtraBold.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
    );
  }
}