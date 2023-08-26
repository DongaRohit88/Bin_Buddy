// ignore_for_file: use_build_context_synchronously

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bin_buddy/Screen/HomePage.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:bin_buddy/constants/constants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

// Splash Screen view
class SplashPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const SplashPage({super.key, required this.cameras});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    getTotalScore();
    Future.delayed(const Duration(seconds: 3), () async {
      await fillScore();
    });
  }

//! local data save level and total Score
  Future<void> fillScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('total_score', Constants.score ?? 0);
    prefs.setInt('level', Constants.level ?? 0);
  }

//! Get Total Score SharedPreferences
  getTotalScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Constants.score = prefs.getInt('total_score') ?? 0;
    Constants.level = prefs.getInt('level') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.PRIMERY_COLOR,
        body: Center(
          child: AnimatedSplashScreen(
              duration: 3500,
              splash: AppAssets.BUDDY_LOGO,
              splashIconSize: 28.h,
              nextScreen: HomePage(cameras: cameras!),
              centered: true,
              splashTransition: SplashTransition.scaleTransition,
              backgroundColor: AppColors.PRIMERY_COLOR),
          // Image.asset(AppAssets.BUDDY_LOGO, height: 30.h)
        ));
  }
}
