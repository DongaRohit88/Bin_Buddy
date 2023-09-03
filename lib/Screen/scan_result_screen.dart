// ignore_for_file: avoid_print, sort_child_properties_last

import 'dart:io';

import 'package:bin_buddy/Comman/app_button.dart';
import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/Screen/Scan_Screen.dart';
import 'package:bin_buddy/Screen/reslut_option_screen.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:bin_buddy/constants/constants.dart';
import 'package:bin_buddy/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

//! Scan Result page
class ScanResultScreen extends StatefulWidget {
  final String? type;
  final int? number;
  final String imagePath;
  final List recognitions;
  const ScanResultScreen(
      {super.key,
      required this.imagePath,
      required this.recognitions,
      this.number,
      this.type});

  @override
  State<ScanResultScreen> createState() => _ScanResultScreenState();
}

class _ScanResultScreenState extends State<ScanResultScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => ScanPage(cameras!)));
      },
      child: Scaffold(
        backgroundColor: AppColors.PRIMERY_COLOR,
        body: SingleChildScrollView(
            child: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(height: 4.h),
              //! Back Button
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: GestureDetector(
                        onTap: () {
                          _showAlertDialog(context);
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
                Image.asset(AppAssets.LINE),
                //! Scan Image
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
                    child: widget.type != "1"
                        ? Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Image.file(File(widget.imagePath),
                                fit: BoxFit.cover),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Image.network(widget.imagePath,
                                fit: BoxFit.cover),
                          ),
                  ),
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
                //! Yes Button
                appButton(
                    width: 30.w,
                    radius: 3.h,
                    color: AppColors.WHITE_COLOR,
                    onTap: () {
                      playSound("Audio2.mp3");
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: ResultOptionScreen(
                                type: widget.type,
                                imagePath: widget.imagePath,
                                title: widget.recognitions.isNotEmpty
                                    ? widget.recognitions[0]['detectedClass']
                                        .toString()
                                    : '')),
                      );
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
                //! No Button
                appButton(
                    width: 30.w,
                    radius: 3.h,
                    color: AppColors.WHITE_COLOR,
                    onTap: () {
                      playSound("Audio2.mp3");
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
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

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Bin Hero'),
          content: const Text(
            'Are you sure you want to close level?',
            style: TextStyle(fontSize: 16, letterSpacing: 0.5),
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ScanPage(cameras!)));
                },
                child: const Text('Yes')),
          ]),
    );
  }
}
