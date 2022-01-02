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
    List<Categories> categoryFiltering =
        songs.where((e) => e.categoryName == widget.categoryFile).toList();

    ///Body
    return Scaffold(
        appBar: AppBar(
          title: Text("Show Songs Category Here"),
        ),
        body: Column(
            children: categoryFiltering
                .map(
                  (e) => Card(
                    elevation: 2,
                    child: ListTile(
                      textColor: Colors.black,
                      iconColor: Colors.black,
                      leading: Icon(Icons.music_note),
                      title: Text(e.songName),
                      subtitle: Text(e.categoryName),
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
