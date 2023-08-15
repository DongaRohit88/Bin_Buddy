// ignore_for_file: use_build_context_synchronously, unnecessary_brace_in_string_interps, avoid_print

import 'package:bin_buddy/Comman/app_dialogs.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:bin_buddy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'Scan_Screen.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  void initState() {
    getTotalScore();
    _initializeDialog();
    super.initState();
  }

  getTotalScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Constants.score = sharedPreferences.getInt('total_score');
    Constants.level = sharedPreferences.getInt('level');
  }

  _initializeDialog() {
    Future.delayed(Duration.zero, () async {
      await AppDialog.showScoreDialog(context,
          level: 'Level ${Constants.level.toString()}',
          score: 'Score:${Constants.score.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ScanPage(cameras!)));
      },
      child: const Scaffold(backgroundColor: AppColors.PRIMERY_COLOR),
    );
  }
}
