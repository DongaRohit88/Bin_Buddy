import 'package:bin_buddy/Comman/app_button.dart';
import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/Comman/score_option.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../Screen/Scan_Screen.dart';
import '../constants/constants.dart';

class AppDialog {
  AppDialog._();

  static Future showScoreDialog(BuildContext context,
      {String? score, String? message, String? level}) async {
    return await showCupertinoDialog(
        context: context,
        builder: (context) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SizedBox(
                  height: 54.h,
                  child:
                      Stack(alignment: Alignment.topCenter, children: <Widget>[
                    Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          height: 46.h,
                          decoration: BoxDecoration(
                              color: AppColors.LIGHT_YELLOW_COLOR,
                              borderRadius: BorderRadius.circular(3.w)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.h),
                                // Image.asset(AppAssets.RATING, scale: 1.3.h),
                                // SizedBox(height: 2.h),
                                Container(
                                    height: 8.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.w),
                                        color: AppColors.WHITE_COLOR,
                                        border: Border.all(
                                            color: AppColors.CIRCLE_COLOR)),
                                    child: Center(
                                      child: appText(
                                          title: score,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 2.5.h),
                                    )),
                                SizedBox(height: 2.h),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      scoreOption(image: AppAssets.COMPOST),
                                      SizedBox(width: 2.5.w),
                                      scoreOption(image: AppAssets.RUBBISH),
                                      SizedBox(width: 2.5.w),
                                      scoreOption(image: AppAssets.RECYCLING),
                                    ]),
                                SizedBox(height: 3.h),
                                appButton(
                                    width: 55.w,
                                    onTap: () {
                                      playSound();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScanPage(cameras!)));
                                    },
                                    child: Center(
                                        child: appText(
                                            title: 'Continue!',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 3.h,
                                            color: AppColors.WHITE_COLOR)),
                                    color: AppColors.PRIMERY_COLOR,
                                    border: Border.all(
                                        color: AppColors.CIRCLE_COLOR,
                                        width: 0.8.w))
                              ]),
                        )),
                    Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.w),
                            color: AppColors.RED_COLOR,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 1.5,
                                  color: AppColors.GREY_COLOR,
                                  offset: Offset(0, 3))
                            ]),
                        child: Center(
                          child: appText(
                              title: level,
                              fontWeight: FontWeight.w700,
                              fontSize: 4.h,
                              color: AppColors.WHITE_COLOR),
                        )),
                  ]),
                ),
              ));
        });
  }

  static Future<bool> showDialog(BuildContext context,
      {required Color closeColor,
      required Color buttonColor,
      required String title,
      required Color titleColor,
      required String image,
      double? scale}) async {
    return await showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return false; // Prevent dialog from being dismissed by back button
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 2.h),
                    appText(
                        title: title,
                        fontSize: 4.h,
                        color: titleColor,
                        fontWeight: FontWeight.w700),
                    SizedBox(height: 2.h),
                    Image.asset(image, scale: scale ?? 0.5.h),
                    SizedBox(height: 2.h),
                    // appText(
                    //   title: 'This is a Custom\n'
                    //       'Textview',
                    //   maxLines: 2,
                    //   color: AppColors.GREY_COLOR,
                    //   textAlign: TextAlign.center,
                    //   textOverflow: TextOverflow.ellipsis,
                    // ),
                    // SizedBox(height: 2.h),
                    appButton(
                        width: 50.w,
                        onTap: () {
                          playSound();
                          Navigator.pop(context, true);
                        },
                        color: buttonColor,
                        child: Center(
                            child: appText(
                                title: 'Ok',
                                color: AppColors.WHITE_COLOR,
                                maxLines: 2))),
                    SizedBox(height: 2.h),
                  ]),
                )),
          );
        });
  }
}
