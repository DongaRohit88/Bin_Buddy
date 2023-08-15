// ignore_for_file: constant_identifier_names

import 'package:audioplayers/audioplayers.dart';

import '../Screen/HomePage.dart';

//! App Use Text String
class Constants {
  static const String appName = 'Bin Buddy';

  static const String packageName = 'com.binbuddy.app';

  static const String ScanResult = 'Scan result';

  static const String compost = 'Compost';

  static const String rubbish = 'Rubbish';

  static const String recycling = 'Recycling';

  static int? level;

  static int? score;
}

// Play Sound Widget on off
void playSound() async {
  if (isplaying) {
    AudioCache audioCache = AudioCache();
    await audioCache.play('WaterDrop1.mp3');
  }
}
