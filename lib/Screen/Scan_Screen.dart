// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison, prefer_if_null_operators, unnecessary_new, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:bin_buddy/Comman/app_button.dart';
import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/Comman/bnd_box.dart';
import 'package:bin_buddy/Comman/camera.dart';
import 'package:bin_buddy/Comman/models.dart';
import 'package:bin_buddy/Screen/scan_result_screen.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import 'package:sizer/sizer.dart';

import '../constants/constants.dart';
import 'HomePage.dart';

class ScanPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ScanPage(this.cameras, {super.key});

  @override
  _ScanPageState createState() => new _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int? totalScore;
  List<dynamic> _recognitions = [];
  int _imageHeight = 0;
  int _imageWidth = 0;
  final String _model = ssd;

  @override
  void initState() {
    loadModel();
    getScore();
    super.initState();
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/ssd_mobilenet.tflite",
        labels: "assets/ssd_mobilenet.txt");
  }

  void setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  Future<void> getScore() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        totalScore = prefs.getInt('total_score');
      });
    } catch (e) {
      print("Error getting score: $e");
    }
  }

  Future<void> _captureAndNavigate() async {
    if (widget.cameras.isEmpty) {
      return;
    }

    try {
      final CameraController cameraController =
          CameraController(widget.cameras[0], ResolutionPreset.medium);
      await cameraController.initialize();
      final XFile imageFile = await cameraController.takePicture();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanResultScreen(
              imagePath: imageFile.path, recognitions: _recognitions),
        ),
      );
    } catch (e) {
      print("Error capturing and navigating: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      body: Stack(
        children: [
          Camera(widget.cameras, _model, setRecognitions),
          BndBox(
              _recognitions == null ? [] : _recognitions,
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              _model),
          Positioned(
            top: 04.h,
            left: 02.w,
            child: IconButton(
                onPressed: () {
                  playSound();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(cameras: widget.cameras)));
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.PRIMERY_COLOR, size: 32)),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 20.h,
        decoration: BoxDecoration(
            color: AppColors.PRIMERY_COLOR,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.h), topRight: Radius.circular(3.h))),
        child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            appButton(
                width: 30.w,
                radius: 3.h,
                color: AppColors.WHITE_COLOR,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText(title: 'Carnet Score'),
                      appText(title: totalScore.toString())
                    ])),
            GestureDetector(
              onTap: _captureAndNavigate,
              child: Container(
                height: 25.w,
                width: 25.w,
                decoration: BoxDecoration(
                    //  color: AppColors.WHITE_COLOR,
                    borderRadius: BorderRadius.circular(25.w),
                    border:
                        Border.all(color: AppColors.CIRCLE_COLOR, width: 1.w)),
                child: Center(
                  child: Image.asset(AppAssets.QR_CODE, scale: 1.5.h),
                ),
              ),
            ),
            appButton(
                width: 30.w,
                radius: 3.h,
                color: AppColors.WHITE_COLOR,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText(title: 'Score List'),
                      appText(title: '5')
                    ])),
          ]),
        ),
      ),
    );
  }
}
