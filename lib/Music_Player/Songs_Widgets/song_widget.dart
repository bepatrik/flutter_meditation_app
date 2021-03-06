import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Model/song_model.dart';

class SongWidget extends StatefulWidget {
  ///Getting data from SONG INFO
  final List<SongInfo> songList;

  ///CONST
  SongWidget({
    @required this.songList,
  });

  @override
  _SongWidgetState createState() => _SongWidgetState();

  static String parseToMinutesSeconds(int ms) {
    String data;
    Duration duration = Duration(milliseconds: ms);

    int minutes = duration.inMinutes;
    int seconds = (duration.inSeconds) - (minutes * 60);

    data = minutes.toString() + ":";
    if (seconds <= 9) data += "0";

    data += seconds.toString();
    return data;
  }
}

class _SongWidgetState extends State<SongWidget> {
  ///Variables
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  PlayerState playerState;
  int songIndex = 0;
  Duration timeElapsed = new Duration();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
        timeElapsed = d;
      });
    });

    advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
        timeElapsed = p;
      });
    });

    advancedPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if (s == PlayerState.COMPLETED) {
        _resetPlayer();
        songIndex = songIndex == widget.songList.length - 1 ? 0 : songIndex + 1;
      }
      setState(() => playerState = s);
    });
  }

  @override
  Widget build(BuildContext context) {
    ///Final size
    // ignore: unused_local_variable
    final Size s = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
        FadeInImage(
          fadeInDuration: Duration(seconds: 2),
          placeholder: AssetImage(
            widget.songList[songIndex].image,
          ),
          image: AssetImage(
            widget.songList[songIndex].image,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              Text(
                "${widget.songList[songIndex].category}",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${widget.songList[songIndex].artist}",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Play previous Song Method
              _playBack(),

              ///Pause & Play
              _play(),

              ///Play Next Song Method
              _fastForward(),
            ],
          ),
        ),

        ///Slider
        slider(),

        ///TImer Duration Widget
        _durationWidget(),
      ],
    );
  }

/*********************************************
 * PLAYBACK
**********************************************/
  Widget _playBack() {
    return IconButton(
      icon: Icon(
        Icons.skip_previous,
        color: Colors.grey.shade700,
        size: 30,
      ),
      onPressed: () {
        setState(
          () {
            _resetPlayer();
            if (songIndex == 0) {
              songIndex = widget.songList.length - 1;
            } else {
              songIndex = songIndex - 1;
            }
          },
        );
      },
    );
  }

/*********************************************
   *PLAY  
**********************************************/
  Widget _play() {
    return IconButton(
        icon: Icon(
          playerState == PlayerState.PLAYING
              ? Icons.pause_circle_outline_outlined
              : Icons.play_circle_outline_outlined,
          color: Colors.grey.shade700,
          size: 30,
        ),
        onPressed: () {
          setState(() {
            playerState == PlayerState.PLAYING
                ? advancedPlayer.pause()
                : audioCache.play(
                    widget.songList[songIndex].song,
                  );
          });
        });
  }

/*********************************************
 * FASTFORWARD METHOD
**********************************************/
  Widget _fastForward() {
    return IconButton(
        icon: Icon(
          Icons.skip_next,
          color: Colors.grey.shade700,
          size: 30,
        ),
        onPressed: () {
          setState(() {
            _resetPlayer();
            if (songIndex == widget.songList.length - 1) {
              songIndex = 0;
            } else {
              songIndex = songIndex + 1;
            }
          });
        });
  }

  Widget slider() {
    ///the defdur is default duration i made like this:
    var defdur = Duration(milliseconds: 0);
/*********************************************
 * SLIDER
**********************************************/
    return Slider(
        activeColor: Colors.blue,
        inactiveColor: Colors.grey[300],
        thumbColor: Colors.white,
        value: _duration != null
            ? _duration > defdur
                ? _position.inMilliseconds.toDouble() ?? 0.0
                : 0.0
            : 0.0,
        onChanged: (double val) {
          setState(() {
            return seekToSecond((val / 1000).roundToDouble().round());
          });
          val = val;
        },
        min: 0.0,
        max: _duration != null
            ? _duration > defdur
                ? _duration.inMilliseconds.toDouble()
                : 0.0
            : 0.0);
  }

/*********************************************
 * SEEK TO SECOND
**********************************************/
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    timeElapsed = newDuration;
    advancedPlayer.seek(newDuration);
  }

/*********************************************
 * RESET PLAYER
**********************************************/
  void _resetPlayer() {
    _position = Duration();
    _duration = Duration();
    timeElapsed = Duration();
    advancedPlayer.stop();
  }

/*********************************************
   * DURATION WIDGET
**********************************************/
  Widget _durationWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${timeElapsed.inMinutes.remainder(60)}:${timeElapsed.inSeconds.remainder(60)}",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${_duration.inMinutes.remainder(60)}:${_duration.inSeconds.remainder(60)}",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
