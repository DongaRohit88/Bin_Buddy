// ignore_for_file: use_build_context_synchronously, unnecessary_brace_in_string_interps, avoid_print

import 'package:bin_buddy/Comman/app_dialogs.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:bin_buddy/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_assets.dart';
import '../main.dart';
import 'Scan_Screen.dart';

class WinScreen extends StatefulWidget {
  final String? typ;
  const WinScreen({Key? key, this.typ}) : super(key: key);

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  void initState() {
    getTotalScore();
    playSound("Audio5.mp3");

    _initializeDialog();
    super.initState();
  }

//! Total Score Get SharedPreferences
  getTotalScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Constants.score = sharedPreferences.getInt('total_score');
    Constants.level = sharedPreferences.getInt('level');
  }

//! Level Score Dialog
  _initializeDialog() {
    print("----typ00 ${widget.typ}");
    Future.delayed(Duration.zero, () async {
      await AppDialog.showScoreDialog(context,
          level: 'Level : ${Constants.level.toString()}',
          score: 'Score : ${Constants.score.toString()}',
          typ: widget.typ);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => ScanPage(cameras!)));
        },
        child: const Scaffold(backgroundColor: AppColors.PRIMERY_COLOR));
  }
}
