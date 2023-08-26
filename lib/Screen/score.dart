import 'package:bin_buddy/Comman/app_dialogs.dart';
import 'package:bin_buddy/Comman/app_text.dart';
import 'package:bin_buddy/constants/app_assets.dart';
import 'package:bin_buddy/constants/app_colors.dart';
import 'package:bin_buddy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ScoreListPage extends StatefulWidget {
  const ScoreListPage({super.key});

  @override
  State<ScoreListPage> createState() => _ScoreListPageState();
}

class _ScoreListPageState extends State<ScoreListPage> {
  @override
  void initState() {
    getTotalScore();
    super.initState();
  }

  getTotalScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Constants.score = sharedPreferences.getInt('total_score');
    Constants.level = sharedPreferences.getInt('level');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.PRIMERY_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.PRIMERY_COLOR,
          title: appText(title: "Score List"),
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              // SizedBox(height: 04.h),
              scoreLevelList.isNotEmpty
                  ? Expanded(
                      // height: 80.h,
                      child: ListView.builder(
                          // reverse: true,
                          shrinkWrap: true,
                          itemCount: scoreLevelList.length,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Card(
                                  elevation: 8,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(AppAssets.BUDDY_LOGO,
                                            height: 4.h),
                                        appText(
                                            title:
                                                "${scoreLevelList[i]["level"]}",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            letterSpacing: 0.5),
                                        SizedBox(width: 8.h),
                                        appText(
                                            title:
                                                "${scoreLevelList[i]["score"]}",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            letterSpacing: 0.5)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: appText(
                          title: "Score not found",
                          letterSpacing: 1,
                          color: AppColors.WHITE_COLOR,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
