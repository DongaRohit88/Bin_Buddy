// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bin_buddy/Comman/app_button.dart';
import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/Screen/Scan_Screen.dart';
import 'package:bin_buddy/Screen/reslut_option_screen.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:bin_buddy/constants/constants.dart';
import 'package:bin_buddy/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ScanResultScreen extends StatefulWidget {
  final String imagePath;
  final List<dynamic> recognitions;
  const ScanResultScreen(
      {super.key, required this.imagePath, required this.recognitions});

  @override
  State<ScanResultScreen> createState() => _ScanResultScreenState();
}

class _ScanResultScreenState extends State<ScanResultScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ScanPage(cameras!)));
      },
      child: Scaffold(
        backgroundColor: AppColors.PRIMERY_COLOR,
        body: SingleChildScrollView(
            child: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(height: 7.h),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScanPage(cameras!),
                              ));
                        },
                        child: Container(
                            height: 10.w,
                            width: 10.w,
                            decoration: BoxDecoration(
                                color: AppColors.CIRCLE_COLOR,
                                borderRadius: BorderRadius.circular(10.w)),
                            child: Icon(Icons.close,
                                color: AppColors.WHITE_COLOR, size: 3.h)),
                      ))),
              SizedBox(height: 5.h),
              appText(
                  title: Constants.ScanResult,
                  color: AppColors.WHITE_COLOR,
                  fontWeight: FontWeight.w700,
                  fontSize: 4.5.h),
              SizedBox(height: 10.h),
              Stack(alignment: Alignment.center, children: [
                // Column(
                //   children: [
                //     Lottie.asset(AppAssets.LINE_LOTTIE),
                //     SizedBox(
                //       height: 1.5.h,
                //     ),
                //     Lottie.asset(AppAssets.LINE_LOTTIE),
                //     SizedBox(
                //       height: 1.5.h,
                //     ),
                //     Lottie.asset(AppAssets.LINE_LOTTIE),
                //     SizedBox(
                //       height: 1.5.h,
                //     ),
                //     Lottie.asset(AppAssets.LINE_LOTTIE),
                //     SizedBox(
                //       height: 1.5.h,
                //     ),
                //     Lottie.asset(AppAssets.LINE_LOTTIE,),
                //      SizedBox(
                //       height: 1.5.h,
                //     ),
                //     Lottie.asset(AppAssets.LINE_LOTTIE,),
                //      SizedBox(
                //       height: 1.5.h,
                //     ),
                //     Lottie.asset(AppAssets.LINE_LOTTIE,),

                //   ],
                // ),
                Image.asset(AppAssets.LINE),
                Container(
                  height: 55.w,
                  width: 55.w,
                  decoration: BoxDecoration(
                      color: AppColors.WHITE_COLOR,
                      border:
                          Border.all(color: AppColors.FONT_COLOR, width: 0.5.w),
                      borderRadius: BorderRadius.circular(55.w)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(55.w),
                      child: Image.file(File(widget.imagePath),
                          fit: BoxFit.cover)),
                ),
              ]),
              SizedBox(height: 3.h),
              widget.recognitions.isNotEmpty
                  ? appText(
                      title: widget.recognitions[0]['detectedClass'].toString(),
                      color: AppColors.WHITE_COLOR,
                      fontWeight: FontWeight.w700,
                      fontSize: 3.h)
                  : const SizedBox(),
              SizedBox(height: 12.h),
              appText(
                  title: 'Did we identify your item correctly?',
                  color: AppColors.WHITE_COLOR,
                  fontWeight: FontWeight.w400,
                  fontSize: 2.5.h),
              SizedBox(height: 5.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                appButton(
                    width: 30.w,
                    radius: 3.h,
                    color: AppColors.WHITE_COLOR,
                    onTap: () {
                      playSound();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultOptionScreen(
                                imagePath: widget.imagePath,
                                title: widget.recognitions.isNotEmpty
                                    ? widget.recognitions[0]['detectedClass']
                                        .toString()
                                    : ''),
                          ));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 6.w,
                              width: 6.w,
                              decoration: BoxDecoration(
                                  color: AppColors.CIRCLE_COLOR,
                                  borderRadius: BorderRadius.circular(6.w)),
                              child: Center(
                                  child: Icon(Icons.done,
                                      color: AppColors.WHITE_COLOR,
                                      size: 2.5.h))),
                          SizedBox(width: 2.5.w),
                          appText(
                              title: 'Yes',
                              fontWeight: FontWeight.w700,
                              fontSize: 2.5.h)
                        ])),
                SizedBox(width: 5.w),
                appButton(
                    width: 30.w,
                    radius: 3.h,
                    color: AppColors.WHITE_COLOR,
                    onTap: () {
                      playSound();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScanPage(cameras!),
                          ));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 6.w,
                              width: 6.w,
                              decoration: BoxDecoration(
                                  color: AppColors.RED_COLOR,
                                  borderRadius: BorderRadius.circular(6.w)),
                              child: Center(
                                  child: Icon(Icons.close,
                                      color: AppColors.WHITE_COLOR,
                                      size: 2.5.h))),
                          SizedBox(width: 2.5.w),
                          appText(
                              title: 'No ',
                              fontWeight: FontWeight.w700,
                              fontSize: 2.5.h)
                        ])),
              ]),
            ]),
          ),
        )),
      ),
    );
  }
}
