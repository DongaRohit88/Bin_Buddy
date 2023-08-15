// ignore_for_file: prefer_void_to_null, avoid_print

import 'package:bin_buddy/Screen/splash_sreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants/constants.dart';

List<CameraDescription>? cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            title: Constants.appName,
            theme: ThemeData(primarySwatch: Colors.blue),
            debugShowCheckedModeBanner: false,
            home: SplashPage(cameras: cameras!));
      },
    );
  }
}
