// ignore_for_file: constant_identifier_names

import 'package:audioplayers/audioplayers.dart';
import 'package:bin_buddy/constants/app_assets.dart';

import '../Screen/HomePage.dart';

//! App Use Text String
class Constants {
  static const String appName = 'Bi';

  static const String packageName = 'com.binhero.app';

  static const String ScanResult = 'Scan result';

  static const String compost = 'Compost';

  static const String rubbish = 'Rubbish';

  static const String recycling = 'Recycling';

  static const String audio1 = 'Recycling';

  static int? level;

  static int? score;
}

List dynamicImage = [
  {
    "Image": AppAssets.Car,
    'detectedClass': 'Car',
  },
  {
    "Image": AppAssets.Car1,
    'detectedClass': 'Car',
  },
  {
    "Image": AppAssets.Elephant,
    'detectedClass': 'Elephant',
  },
  {
    "Image": AppAssets.Lion,
    'detectedClass': 'Lion',
  },
  {
    "Image": AppAssets.Watch,
    'detectedClass': 'Watch',
  },
  {
    "Image": AppAssets.Laptop,
    'detectedClass': 'Laptop',
  },
  {
    "Image": AppAssets.Mobile,
    'detectedClass': 'Mobile',
  },
  {
    "Image": AppAssets.Mouse,
    'detectedClass': 'Mouse',
  },
  {
    "Image": AppAssets.Keybord,
    'detectedClass': 'Keybord',
  },
];
// Play Sound Widget on off
AudioPlayer audioPlayer = AudioPlayer();
void playSound(String soundTitel) async {
  AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
  // Stream<Duration> srt1 = audioPlayer.onAudioPositionChanged;
  // Stream<PlayerState> srt2 = audioPlayer.onPlayerStateChanged;

  if (audioPlayer.state.name != "PLAYING") {
    isplaying = true;
    await audioCache.play(soundTitel);
  } else {
    isplaying = false;
    await audioPlayer.stop();
  }
}
