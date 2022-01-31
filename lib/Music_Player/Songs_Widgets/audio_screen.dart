import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Model/song_model.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/song_widget.dart';

class AudioPlayerScreen extends StatelessWidget {
  ///Final id
  static final id = '/AudioPlayerScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _audioPlayerWidget(),
      ),
    );
  }

  Widget _audioPlayerWidget() {
    List<SongInfo> songs = [
/*********************************************
 * CALM MUSIC
**********************************************/
      SongInfo(
        category: 'Calm Sounds',
        song: 'calm1.mpeg',
        artist: 'Artist 1',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Calm Sounds',
        song: 'calm2.mpeg',
        artist: 'Artist 2',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Calm Sounds',
        song: 'calm3.mpeg',
        artist: 'Artist 3',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Calm Sounds',
        song: 'calm4.mpeg',
        artist: 'Artist 4',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Calm Sounds',
        song: 'calm5.mpeg',
        artist: 'Artist 5',
        image: 'images/music1.png',
      ),
/*********************************************
 * FAST MUSIC
**********************************************/
      SongInfo(
        category: 'Fast Musuc',
        song: 'music_(1).mpeg',
        artist: 'Ali ijaz',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Fast Music',
        song: 'music_(2).mpeg',
        artist: 'Faraz Ahmad',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Fast Music',
        song: 'music_(4).mpeg',
        artist: 'Zeeshan Tariq',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Fast Music',
        song: 'music_(4).mpeg',
        artist: 'Hassan Abbas',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Fast Music',
        song: 'music_(5).mpeg',
        artist: 'Zubair ch',
        image: 'images/music1.png',
      ),
/*********************************************
 * Nature MUSIC
**********************************************/
      SongInfo(
        category: 'Nature Music',
        song: 'nature1.mpeg',
        artist: 'Artist 1',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Nature Music',
        song: 'nature2.mpeg',
        artist: 'Artist 2',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Nature Music',
        song: 'nature3.mpeg',
        artist: 'Artist 3',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Nature Music',
        song: 'nature4.mpeg',
        artist: 'Artist 4',
        image: 'images/music1.png',
      ),
      SongInfo(
        category: 'Nature Music',
        song: 'nature5.mpeg',
        artist: 'Artist 5',
        image: 'images/music1.png',
      ),
/*********************************************
 * SLEEPY MUSIC
**********************************************/
      SongInfo(
        category: 'Sleepy Music',
        song: 'sleepy1.mpeg',
        artist: 'Zeeshan Baaghi',
        image: 'images/music1.png',
      ),
    ];

    ///Sending Data to Screen Song_Widget
    return Column(
      children: [
        SongWidget(
          songList: songs,
        )
      ],
    );
  }
}
