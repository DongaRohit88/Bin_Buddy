import 'package:bin_buddy/constants/app_colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../Comman/app_button.dart';
import '../Comman/app_text.dart';
import '../constants/app_assets.dart';
import '../constants/constants.dart';
import 'Scan_Screen.dart';

bool isplaying = true;

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomePage({super.key, required this.cameras});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> navigat() async {
    await SystemNavigator.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigat();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.PRIMERY_COLOR,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings_outlined,
                              color: AppColors.WHITE_COLOR, size: 32)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isplaying = !isplaying;
                          });
                        },
                        icon: Icon(
                            isplaying
                                ? Icons.volume_down_outlined
                                : Icons.volume_off_outlined,
                            color: AppColors.WHITE_COLOR,
                            size: 32),
                      )
                    ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Image.asset(AppAssets.BUDDY_LOGO, height: 16.h),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    appButton(
                        height: 06.h,
                        width: 36.w,
                        radius: 3.h,
                        color: AppColors.WHITE_COLOR,
                        onTap: () {
                          playSound();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ScanPage(widget.cameras)));
                        },
                        child: appText(
                            title: 'Scan Play',
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                    appButton(
                        height: 06.h,
                        width: 36.w,
                        radius: 3.h,
                        onTap: () {
                          playSound();
                        },
                        color: AppColors.WHITE_COLOR,
                        child: appText(
                            title: 'Pick Play',
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
