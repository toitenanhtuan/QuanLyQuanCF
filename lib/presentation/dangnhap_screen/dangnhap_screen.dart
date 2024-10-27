import 'package:appqlcafe/routes/app_routes.dart';
import 'package:appqlcafe/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevanted_button.dart';
import 'bloc/dangnhap_bloc.dart';
import 'models/dangnhap_model.dart';
import '../../theme/theme_helper.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../core/utils/validation_functions.dart';

class DangnhapScreen extends StatelessWidget {
  DangnhapScreen({Key? key})
    : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder (BuildContext context) {
    return BlocProvider<DangnhapBloc>(
      create: (context) =>
      DangnhapBloc(DangnhapState(
        dangnhapModelObj: DangnhapModel(),
      ))
        ..add(DangnhapInitialEvent()),
      child: DangnhapScreen(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return SafeArea(child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.black900,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.black900,
            image: DecorationImage(image: AssetImage(ImageConstant.imgGetStarted),
            fit: BoxFit.fill,
            ),
          ),
          child: SizedBox(
            height: SizeUtils.height,
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 42.h,
                ),
                child: Column(
                  children: [
                    Spacer(),
                    _buildEmailLoginSection(context),
                    SizedBox(height: 18.h),
                    Text(
                      "quen_mat_khau".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 34.h),
                    RichText(
                      text:
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "chua_co_tk".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "dang_ky".tr,
                            style: CustomTextStyles.titleSmallExtraBold,
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Section
  Widget _buildEmailLoginSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "email".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 12.h),
          BlocSelector<DangnhapBloc, DangnhapState, TextEditingController?>(
            selector: (state) => state.emailtwoController,
            builder: (context, emailtwoController) {
              return CustomTextFormField(
                controller: emailtwoController,
                hintText: "nhap_mail_cua_ban".tr,
                textInputType: TextInputType.emailAddress,
                contentPadding: EdgeInsets.fromLTRB(24.h, 14.h, 24.h, 12.h),
                borderDecoration: TextFormFieldStyleHelper.fillWhiteA,
                fillColor: appTheme.whiteA700,
                validator: (value) {
                  if (value == null ||
                      (!isValidEmail (value, isRequired: true))) {
                    return "err_msg_please_enter_valid_email".tr;
                  }
                  return null;
                },
              );
            },
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "mat_khau".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 10.h),
          BlocSelector<DangnhapBloc, DangnhapState, TextEditingController?>(
            selector: (state) => state.nhapmatkhauoneController,
            builder: (context, nhapmatkhauoneController) {
              return CustomTextFormField(
                controller: nhapmatkhauoneController,
                hintText: "nhap_mk".tr,
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.fromLTRB(24.h, 14.h, 24.h, 12.h),
                borderDecoration: TextFormFieldStyleHelper.fillOnPrimary,
              );
            },
          ),
          SizedBox(height: 54.h),
          CustomElevatedButton(
            height: 64.h,
            text: "dang_nhap".tr,
            margin: EdgeInsets.only(
              left: 32.h,
              right: 28.h,
            ),
            buttonStyle: CustomButtonStyles.fillBlueGray,
            buttonTextStyle: CustomTextStyles.titleLargePrimary,
            onPressed: () {
              onTapDangNhap(context);
            },
          )
        ],
      ),
    );
  }

  void onTapDangNhap(BuildContext context) async {
    final bloc = context.read<DangnhapBloc>();
    final emailController = bloc.state.emailtwoController;

    if (emailController != null && emailController.text.isNotEmpty) {
      // Lưu email vào SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', emailController.text);

      NavigatorService.pushNamed(AppRoutes.trangCfScreen);
    }
  }
}