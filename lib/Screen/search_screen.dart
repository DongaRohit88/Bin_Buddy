// import 'package:bin_buddy/Comman/app_text.dart';
// import 'package:bin_buddy/constants/app_assets.dart';
// import 'package:bin_buddy/constants/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:sizer/sizer.dart';
//! Extra Page Search Page
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.PRIMERY_COLOR,
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 7.h),
//                   Align(
//                       alignment: Alignment.topRight,
//                       child: Padding(
//                         padding: EdgeInsets.only(right: 6.w),
//                         child: GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               height: 10.w,
//                               width: 10.w,
//                               decoration: BoxDecoration(
//                                   color: AppColors.CIRCLE_COLOR,
//                                   borderRadius: BorderRadius.circular(10.w)),
//                               child: Icon(Icons.close,
//                                   color: AppColors.WHITE_COLOR, size: 3.h),
//                             )),
//                       )),
//                   SizedBox(height: 5.h),
//                   Image.asset(AppAssets.SEARCH, scale: 0.4.h),
//                   SizedBox(height: 4.h),
//                   appText(
//                       title: 'What is your item?',
//                       color: AppColors.WHITE_COLOR,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 4.h),
//                   SizedBox(height: 2.h),
//                   appText(
//                       title: 'Search my comprehensive database of over\n'
//                           '5,000 items to see if I can find your best local\n'
//                           'recycling or disposal option.',
//                       color: AppColors.WHITE_COLOR,
//                       fontWeight: FontWeight.w400,
//                       textAlign: TextAlign.center,
//                       fontSize: 2.h),
//                   SizedBox(height: 8.h),
//                   Container(
//                     height: 6.5.h,
//                     width: 85.w,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(3.w),
//                         color: AppColors.CIRCLE_COLOR),
//                     child: TextFormField(
//                         style: TextStyle(color: AppColors.WHITE_COLOR),
//                         cursorColor: AppColors.WHITE_COLOR,
//                         decoration: const InputDecoration(
//                             hintText: 'Search for an item',
//                             hintStyle: TextStyle(color: AppColors.WHITE_COLOR),
//                             prefixIcon: Icon(Icons.search),
//                             prefixIconColor: AppColors.WHITE_COLOR,
//                             border: InputBorder.none)),
//                   ),
//                   SizedBox(height: 2.h),
//                 ]),
//           ),
//         ));
//   }
// }
