import 'package:assets_audio_player/assets_audio_player.dart';

class AudioPlayerModelFactory {
  String id;
  bool unocked;
  bool isPlaying;
  Audio audio;

  AudioPlayerModelFactory({
    this.id,
    this.isPlaying,
    this.audio,
    bool unlocked,
  });
}

List<AudioPlayerModelFactory> getAudioPlayerModels() {
  return [
    AudioPlayerModelFactory(
      id: "1",
      unlocked: false,
      isPlaying: false,
      audio: Audio(
        "assets/dabb_32_bore.mp4",
        metas: Metas(
          id: "1",
          title: "My Country Song",
          artist: "Zeeshan Tariq",
          album: "Country Album",
          // image: MetasImage.asset("assets/images/country_image.png"),
        ),
      ),
    ),
    AudioPlayerModelFactory(
      id: "2",
      unlocked: false,
      isPlaying: false,
      audio: Audio(
        "assets/Music_(1).mpeg",
        metas: Metas(
          id: "2",
          title: "My Country Song",
          artist: "Ali ijaz",
          album: "Country Album",
          // image: MetasImage.asset("assets/images/country_image.png"),
        ),
      ),
    ),
  ];
}
