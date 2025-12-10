import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';

import '../../../core/utils/media_query_sizes.dart';
import 'following_request_custom_widget.dart';

class FollowingRequestBody extends StatelessWidget {
  const FollowingRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: SizedBox(
            width: SizeConfig.screenWidth! * 0.15,
            child: IconStepper(
              direction: Axis.vertical,
              stepColor: Colors.transparent,
              activeStepColor: Colors.transparent,
              activeStepBorderColor: Colors.transparent,
              activeStepBorderPadding: 0,
              enableNextPreviousButtons: false,
              lineColor: const Color(0xff09b214),
              lineLength: SizeConfig.screenHeight! * 0.08,
              alignment: Alignment.topCenter,
              icons: [
                Icon(
                  Icons.check_circle,
                  color: const Color(0xff09b214),
                  size: 20.sp,
                ),
                Icon(
                  Icons.check_circle,
                  color: const Color(0xff09b214),
                  size: 20.sp,
                ),
                Icon(
                  Icons.check_circle,
                  color: const Color(0xff09b214),
                  size: 20.sp,
                ),
                Icon(
                  Icons.check_circle,
                  color: const Color(0xff09b214),
                  size: 20.sp,
                ),
                Icon(
                  Icons.check_circle,
                  color: const Color(0xff09b214),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.815,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return FadeInLeft(child: const FollowingRequestCustomWidget());
            },
          ),
        ),
      ],
    );
  }
}
