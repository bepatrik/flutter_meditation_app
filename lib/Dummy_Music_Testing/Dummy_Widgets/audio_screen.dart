import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Dummy_Music_Testing/Dummy_Model/song_model.dart';
import 'package:flutter_meditation_app/Dummy_Music_Testing/Dummy_Widgets/song_widget.dart';

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _audioPlayerWidget()),
    );
  }

  Widget _audioPlayerWidget() {
    List<SongInfo> songs = [
      SongInfo(
        songTitle: 'Calm Sounds',
        song: 'nature1.mpeg',
        artist: 'Nature',
        image: 'images/music1.png',
      ),
      SongInfo(
        songTitle: 'Music 2',
        song: 'nature2.mpeg',
        artist: 'Ali ijaz',
        image: 'images/music1.png',
      ),
      SongInfo(
        songTitle: 'Music 3',
        song: 'nature3.mpeg',
        artist: 'Faraz',
        image: 'images/music1.png',
      ),
    ];
    return Column(
      children: [
        SongWidget(
          songList: songs,
        )
      ],
    );
  }
}
