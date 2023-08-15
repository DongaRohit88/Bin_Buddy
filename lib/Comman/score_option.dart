import 'package:bin_buddy/Comman/app_button.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget scoreOption({
  required String image,
}) {
  return SizedBox(
    height: 18.w,
    width: 17.w,
    // color: AppColors.RED_COLOR,
    child: Stack(alignment: Alignment.topLeft, children: [
      Container(
          height: 15.w,
          width: 15.w,
          decoration: BoxDecoration(
              color: AppColors.WHITE_COLOR,
              borderRadius: BorderRadius.circular(1.w),
              border: Border.all(color: AppColors.CIRCLE_COLOR, width: 0.3.w)),
          child: Center(
            child: Image.asset(image, scale: 2.h),
          )),
      Align(
          alignment: Alignment.bottomRight,
          child: appButton(
            width: 6.w,
            height: 6.w,
            radius: 6.w,
            color: AppColors.CIRCLE_COLOR,
            child: Center(
              child:
                  Icon(Icons.done, color: AppColors.WHITE_COLOR, size: 2.5.h),
            ),
          )),
    ]),
  );
}
