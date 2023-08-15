// ignore_for_file: avoid_print

import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/Screen/Scan_Screen.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:bin_buddy/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnalysingScreen extends StatefulWidget {
  const AnalysingScreen({super.key});

  @override
  State<AnalysingScreen> createState() => _ScanResultScreenState();
}

class _ScanResultScreenState extends State<AnalysingScreen> {
  @override
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                          builder: (context) =>
                                              ScanPage(cameras!)));
                                },
                                child: Container(
                                  height: 10.w,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.CIRCLE_COLOR,
                                      borderRadius:
                                          BorderRadius.circular(10.w)),
                                  child: Icon(Icons.close,
                                      color: AppColors.WHITE_COLOR, size: 3.h),
                                )),
                          )),
                      SizedBox(height: 5.h),
                      appText(
                          title: 'Analysing your item',
                          color: AppColors.WHITE_COLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 4.h),
                      SizedBox(height: 6.h),
                      Container(
                          height: 55.w,
                          width: 55.w,
                          decoration: BoxDecoration(
                              color: AppColors.CIRCLE_COLOR,
                              borderRadius: BorderRadius.circular(55.w)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(55.w),
                              child: Image.asset(AppAssets.LINE2))),
                      SizedBox(height: 8.h),
                      appText(
                          title: 'How I work',
                          color: AppColors.WHITE_COLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 4.h),
                      SizedBox(height: 5.h),
                      appText(
                          title: 'I use artificial intelligence to recognize\n'
                              'different items. Every time you upload a\n'
                              'photo you are helping me learn.',
                          color: AppColors.WHITE_COLOR,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w300,
                          fontSize: 2.5.h),
                    ]),
              ),
            ),
          )),
    );
  }
}
