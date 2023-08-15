import 'package:bin_buddy/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// App Button Comman
Widget appButton(
    {Widget? child,
    VoidCallback? onTap,
    Color? color,
    Color? borderColor,
    double? margin,
    double? width,
    double? height,
    verticalmargin,
    double? radius,
    Widget? icon,
    border}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        height: height ?? 7.h,
        width: width ?? 80.w,
        decoration: BoxDecoration(
            color: color ?? AppColors.PRIMERY_COLOR,
            borderRadius: BorderRadius.circular(radius ?? 7.h),
            border: border),
        child: Center(child: child)),
  );
}
