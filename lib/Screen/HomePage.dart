// ignore_for_file: sort_child_properties_last

import 'dart:math';

import 'package:bin_buddy/Screen/scan_result_screen.dart';
import 'package:bin_buddy/Screen/score.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

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
  Random random = Random();
  bool up = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      // timeDilation = 3.0;
      Future.delayed(const Duration(seconds: 0), () {
        setState(() {});
        up = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.PRIMERY_COLOR,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(children: [
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const ScoreListPage()),
                      );
                    },
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
                        size: 32))
              ]),
              SizedBox(height: MediaQuery.of(context).size.height * 0.13),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(32)),
                  child: Image.asset(AppAssets.BUDDY_LOGO, height: 16.h)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.45),
              AnimatedContainer(
                padding: const EdgeInsets.all(10.0),
                duration: const Duration(milliseconds: 250), // Animation speed
                transform: Transform.translate(
                  offset:
                      Offset(0, up ? -150 : 40), // Change -100 for the y offset
                ).transform,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedButton(
                          height: 06.h,
                          width: 36.w,
                          borderRadius: 50.0,
                          child: appText(
                              title: 'Scan Play',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          type: PredefinedThemes.light,
                          onTap: () {
                            //! Activity sound widget

                            playSound("Audio1.mp3");
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: ScanPage(widget.cameras)),
                            );
                          }),
                      AnimatedButton(
                          height: 06.h,
                          width: 36.w,
                          borderRadius: 50.0,
                          child: appText(
                              title: 'Pick Play',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          type: PredefinedThemes.light,
                          onTap: () {
                            playSound("Audio1.mp3");
                            int randomNumber =
                                random.nextInt(dynamicImage.length);
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: ScanResultScreen(
                                      type: "1",
                                      number: randomNumber,
                                      imagePath: dynamicImage[randomNumber]
                                          ["Image"],
                                      recognitions: [
                                        dynamicImage[randomNumber]
                                      ])),
                            );
                          }),
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
