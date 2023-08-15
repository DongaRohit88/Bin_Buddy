import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget option(
    {required String image,
    required String title,
    VoidCallback? onTap,
    required bool isHovered,
    required bool visible}) {
  return Visibility(
    visible: visible,
    child: Column(children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
            height: isHovered ? 40.w : 25.w,
            width: isHovered ? 40.w : 25.w,
            decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR,
                borderRadius: BorderRadius.circular(isHovered ? 40.w : 25.w),
                border: Border.all(color: AppColors.CIRCLE_COLOR, width: 1.w)),
            child: Center(child: Image.asset(image, scale: 1.5.h))),
      ),
      SizedBox(height: 1.h),
      appText(
          title: title,
          color: AppColors.WHITE_COLOR,
          fontWeight: FontWeight.w300,
          fontSize: 2.5.h),
    ]),
  );
}
