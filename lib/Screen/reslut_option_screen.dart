// ignore_for_file: unused_local_variable, sort_child_properties_last, avoid_print, unnecessary_null_comparison, unused_field, use_build_context_synchronously

import 'dart:io';

import 'package:bin_buddy/Comman/app_dialogs.dart';
import 'package:bin_buddy/Comman/app_option.dart';
import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/Screen/win_screen.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Comman/models.dart';
import '../constants/constants.dart';

//! image scan Result page
class ResultOptionScreen extends StatefulWidget {
  final String? type;
  final String imagePath;
  final String title;

  const ResultOptionScreen(
      {Key? key, required this.imagePath, required this.title, this.type})
      : super(key: key);

  @override
  State<ResultOptionScreen> createState() => _ResultOptionScreenState();
}

class _ResultOptionScreenState extends State<ResultOptionScreen> {
  String? _draggedImagePath;
  String? _hoveredOption;
  bool compost = true;
  bool rubbish = true;
  bool recycling = true;
  String data1 = 'person';

  @override
  void initState() {
    getTotalScore();
    super.initState();
  }

//! App total score and level get
  getTotalScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Constants.score = sharedPreferences.getInt('total_score');
    Constants.level = sharedPreferences.getInt('level');
  }

//! scan result correct to show dialog open
  showWinDailog(typ) async {
    playSound("Audio2.mp3");
    bool isConfrimed = await AppDialog.showDialog(
      context,
      closeColor: AppColors.YELLOW_COLOR,
      buttonColor: AppColors.YELLOW_COLOR,
      titleColor: AppColors.YELLOW_COLOR,
      title: 'Correct!',
      image: AppAssets.TROPHY,
    );

    if (isConfrimed) {
      setState(() {
        Constants.score = Constants.score! + 5;
        Constants.level = Constants.level! + 1;
      });
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setInt('total_score', Constants.score!);
      sharedPreferences.setInt('level', Constants.level!);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => WinScreen(typ: typ)));
    }
  }
//! scan result In Correct to show dialog open

  showLoseDialog() async {
    playSound("Audio3.mp3");
    bool isConfrimed = await AppDialog.showDialog(
      context,
      closeColor: AppColors.RED_COLOR,
      buttonColor: AppColors.RED_COLOR,
      titleColor: AppColors.RED_COLOR,
      title: 'In Correct!',
      scale: 0.7.h,
      image: AppAssets.CANCLE,
    );
    if (isConfrimed) {
      setState(() {
        Constants.score = Constants.score! + 5;
        Constants.level = Constants.level! + 1;
      });
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setInt('total_score', Constants.score!);
      sharedPreferences.setInt('level', Constants.level!);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const WinScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMERY_COLOR,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: 4.h),
            //! Back Button
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: GestureDetector(
                    onTap: () {
                      _showAlertDialog(context);
                      playSound("Audio2.mp3");
                    },
                    child: Container(
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                            color: AppColors.CIRCLE_COLOR,
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Icon(Icons.close,
                            color: AppColors.WHITE_COLOR, size: 3.h)),
                  ),
                )),
            SizedBox(height: 5.h),
            appText(
                title: Constants.ScanResult,
                color: AppColors.WHITE_COLOR,
                fontWeight: FontWeight.w700,
                fontSize: 4.5.h),
            SizedBox(height: 10.h),
            Stack(alignment: Alignment.center, children: [
              Image.asset(AppAssets.LINE),
              //! Draggable image
              Draggable<String>(
                  data: widget.title,
                  child: Container(
                    height: 55.w,
                    width: 55.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.FONT_COLOR, width: 0.5.w),
                        borderRadius: BorderRadius.circular(55.w)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(55.w),
                        child: widget.type != "1"
                            ? Image.file(File(widget.imagePath),
                                fit: BoxFit.cover)
                            : Image.network(widget.imagePath,
                                fit: BoxFit.cover)),
                  ),
                  //! Scroll image
                  feedback: Container(
                    width: 38.w,
                    height: 38.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55.w)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(55.w),
                        child: widget.type != "1"
                            ? Image.file(File(widget.imagePath),
                                fit: BoxFit.cover)
                            : Image.network(widget.imagePath,
                                fit: BoxFit.cover)),
                  )),
            ]),
            SizedBox(height: 3.h),
            widget.title != null
                ? appText(
                    title: widget.title,
                    color: AppColors.WHITE_COLOR,
                    fontWeight: FontWeight.w700,
                    fontSize: 3.h)
                : const SizedBox(),

            SizedBox(height: 8.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              DragTarget<String>(builder: (BuildContext context,
                  List<String?> candidateData, List<dynamic> rejectedData) {
                return option(
                    visible: true,
                    image: AppAssets.COMPOST,
                    title: Constants.rubbish,
                    isHovered: false
                    // _hoveredOption == Constants.compost
                    );
              }, onWillAccept: (data) {
                setState(() {
                  rubbish = false;
                  recycling = false;
                  _hoveredOption =
                      Constants.compost; // Update the hovered option
                });
                print("DATA : $data");

                return true;
              }, onLeave: (data) {
                setState(() {
                  rubbish = true;
                  recycling = true;
                  _hoveredOption =
                      null; // Reset hovered option when dragging leaves
                });
              }, onAccept: (data) {
                print("------------->>>data print :3:  $data");
                setState(() {
                  rubbish = true;
                  recycling = true;
                  _hoveredOption = null;
                  _draggedImagePath = data;
                });
                wastList.contains(data) ? showWinDailog("1") : showLoseDialog();
              }),
              DragTarget<String>(builder: (BuildContext context,
                  List<String?> candidateData, List<dynamic> rejectedData) {
                return option(
                    visible: true,
                    image: AppAssets.RUBBISH,
                    title: Constants.compost,
                    isHovered: false
                    //_hoveredOption == Constants.rubbish
                    );
              }, onWillAccept: (data) {
                setState(() {
                  compost = false;
                  recycling = false;
                  _hoveredOption =
                      Constants.rubbish; // Update the hovered option
                });
                return true;
              }, onLeave: (data) {
                setState(() {
                  compost = true;
                  recycling = true;
                  _hoveredOption =
                      null; // Reset hovered option when dragging leaves
                });
              }, onAccept: (data) {
                print("------- Data ::: ${data}");
                setState(() {
                  compost = true;
                  recycling = true;
                  _hoveredOption = null;
                  _draggedImagePath = data;
                });
                organicList.contains(data)
                    ? showWinDailog("2")
                    : showLoseDialog();
              }),
              DragTarget<String>(builder: (BuildContext context,
                  List<String?> candidateData, List<dynamic> rejectedData) {
                return option(
                    visible: true,
                    image: AppAssets.RECYCLING,
                    title: Constants.recycling,
                    isHovered: false
                    //  _hoveredOption == Constants.recycling
                    );
              }, onWillAccept: (data) {
                setState(() {
                  rubbish = false;
                  compost = false;
                  _hoveredOption =
                      Constants.recycling; // Update the hovered option
                });
                // Return true if the dragged data (image path) is acceptable by this target
                return true;
              }, onLeave: (data) {
                setState(() {
                  rubbish = true;
                  compost = true;
                  _hoveredOption =
                      null; // Reset hovered option when dragging leaves
                });
              }, onAccept: (data) {
                setState(() {
                  rubbish = true;
                  compost = true;
                  _hoveredOption = null;
                  _draggedImagePath = data;
                });
                recyclablesList.contains(data)
                    ? showWinDailog("3")
                    : showLoseDialog();
              }),
            ]),
          ]),
        ),
      )),
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
                  Navigator.pop(context);
                },
                child: const Text('Yes')),
          ]),
    );
  }
}
