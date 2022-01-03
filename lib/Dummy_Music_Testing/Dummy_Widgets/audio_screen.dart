import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Dummy_Music_Testing/Dummy_Model/song_info.dart';
import 'package:flutter_meditation_app/Dummy_Music_Testing/Dummy_Widgets/song_widget.dart';
import 'package:flutter_meditation_app/Models/songs_model.dart';

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
        songTitle: 'Music 1',
        song: 'nature1.mpeg',
        artist: 'Zeeshan Tariq',
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
