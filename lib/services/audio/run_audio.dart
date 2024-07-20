import 'package:audioplayers/audioplayers.dart';

class RunAudio{
  static AudioPlayer player = AudioPlayer();

  static initAudio()async{
    player.setReleaseMode(ReleaseMode.stop);
    await player.setSource(AssetSource('sounds/run.mp3'));
  }

  static void runAudio()async{
    await player.resume();
  }

}