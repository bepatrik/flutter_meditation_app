import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Models/songs_model.dart';

// ignore: must_be_immutable
class DisplayScreen extends StatefulWidget {
  static final id = '/DisplayScreen';

  ///CategoryFile
  ///to get data from main Screen
  String categoryFile;

  ///Const
  DisplayScreen({
    this.categoryFile,
  });

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  ///Playing and Stop
  bool playing = false;

  IconData plyBtn;

  @override
  Widget build(BuildContext context) {
    ///Making an List
    ///which will filter the categories
    List<SongsModelUI> newList =
        audios.where((e) => e.category == widget.categoryFile).toList();

    ///Body
    return Scaffold(
        appBar: AppBar(),
        body: Column(
            children: newList
                .map(
                  (e) => Card(
                    elevation: 2,
                    child: ListTile(
                      textColor: Colors.black,
                      iconColor: Colors.black,
                      leading: Icon(Icons.music_note),
                      title: Text(e.name),
                      subtitle: Text('Subtitle'),
                      trailing: IconButton(
                        onPressed: () {
                          if (!playing) {
                            setState(() {
                              plyBtn = Icons.pause;
                              playing = true;
                            });
                          } else {
                            setState(() {
                              plyBtn = Icons.play_arrow;
                              playing = false;
                            });
                          }
                        },
                        icon: Icon(plyBtn),
                      ),
                    ),
                  ),
                )
                .toList()));
  }
}
/*
                          onPressed: () {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio(e.name),
                              showNotification: true,
                            );
                          },
*/
