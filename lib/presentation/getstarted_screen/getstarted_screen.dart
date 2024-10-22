import 'package:appqlcafe/routes/app_routes.dart';
import 'package:appqlcafe/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevanted_button.dart';
import 'bloc/getstarted_bloc.dart';
import 'models/getstarted_model.dart';
import '../../theme/theme_helper.dart';
import '../../core/utils/image_constant.dart';

class GetstartedScreen extends StatelessWidget {
  const GetstartedScreen({Key? key})
      : super(
    key: key,);

  static Widget builder(BuildContext context) {
    return BlocProvider<GetstartedBloc>(
      create: (context) =>
      GetstartedBloc(GetstartedState(
        getstartedModelObj: GetstartedModel(),
      ))
        ..add(GetstartedInitialEvent()),
      child: GetstartedScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetstartedBloc, GetstartedState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                backgroundColor: appTheme.black900,
                body: Container(
                  width: double.maxFinite,
                  height: SizeUtils.height,
                  decoration: BoxDecoration(
                    color: appTheme.black900,
                    image: DecorationImage(
                        image: AssetImage(
                            ImageConstant.imgGetStarted,
                        ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 70.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Spacer(), _buildGoodCoffeeSection(context)],
                    ),
                  ),
                ),
              ),
          );
        },
    );
  }

  //Section
  Widget _buildGoodCoffeeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: Column(
        children: [
          Text(
            "good_coffee".tr,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.headlineMediumBluegray100.copyWith(
              height: 1.14,
            ),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            width: 164.h,
            child: Text(
              "".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmall0nPrimary,
            ),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            height: 5.h,
            child: AnimatedSmoothIndicator(
              activeIndex: 0,
              count: 3,
              effect: ScrollingDotsEffect(
                spacing: 7,
                activeDotColor: theme.colorScheme.primary,
                dotColor: appTheme.blueGray10001,
                dotHeight: 5.h,
                dotWidth: 5.h,
              ),
            ),
          ),
          SizedBox(height: 36.h),
          CustomElevatedButton(
            height: 64.h,
            text: "get_started".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleLargeGray50,
            onPressed: () {
              onTapGetstarted(context);
            },
          )
        ],
      ),
    );
  }

  onTapGetstarted(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dangnhapScreen,
    );
  }
}