// // ignore_for_file: avoid_print

// import 'package:bin_buddy/Comman/app_text.dart';
// import 'package:bin_buddy/Screen/Scan_Screen.dart';
// import 'package:bin_buddy/constants/app_assets.dart';
// import 'package:bin_buddy/constants/app_colors.dart';
// import 'package:bin_buddy/main.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// import '../constants/constants.dart';
//! Extra Screen  Cellular Phone
// class CellularPhoneScreen extends StatefulWidget {
//   const CellularPhoneScreen({
//     super.key,
//   });

//   @override
//   State<CellularPhoneScreen> createState() => _ScanResultScreenState();
// }

// class _ScanResultScreenState extends State<CellularPhoneScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return await Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => ScanPage(cameras!)));
//       },
//       child: Scaffold(
//           backgroundColor: AppColors.PRIMERY_COLOR,
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Center(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 7.h),
//                       Align(
//                           alignment: Alignment.topRight,
//                           child: Padding(
//                               padding: EdgeInsets.only(right: 6.w),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   playSound();
//                                   Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ScanPage(cameras!)));
//                                 },
//                                 child: Container(
//                                   height: 10.w,
//                                   width: 10.w,
//                                   decoration: BoxDecoration(
//                                       color: AppColors.CIRCLE_COLOR,
//                                       borderRadius:
//                                           BorderRadius.circular(10.w)),
//                                   child: Icon(Icons.close,
//                                       color: AppColors.WHITE_COLOR, size: 3.h),
//                                 ),
//                               ))),
//                       SizedBox(height: 5.h),
//                       appText(
//                           title: 'Cellular phone',
//                           color: AppColors.WHITE_COLOR,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 4.h),
//                       SizedBox(height: 10.h),
//                       Stack(alignment: Alignment.center, children: [
//                         Image.asset(AppAssets.LINE),
//                         Tooltip(
//                             verticalOffset: -40,
//                             decoration:
//                                 const BoxDecoration(color: AppColors.RED_COLOR),
//                             message: 'Please do not dispose\n'
//                                 'in your kerbside bins',
//                             child: Container(
//                               height: 55.w,
//                               width: 55.w,
//                               decoration: BoxDecoration(
//                                   color: AppColors.WHITE_COLOR,
//                                   borderRadius: BorderRadius.circular(55.w)),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(55.w),
//                                 child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Image.asset(AppAssets.BIN,
//                                           fit: BoxFit.cover),
//                                       Image.asset(AppAssets.ALERT,
//                                           height: 23.h),
//                                     ]),
//                               ),
//                             )),
//                       ]),
//                     ]),
//               ),
//             ),
//           )),
//     );
//   }
// }
