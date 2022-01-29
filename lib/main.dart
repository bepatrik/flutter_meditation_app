import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Credentials_Screens/login_page.dart';
import 'package:flutter_meditation_app/Credentials_Screens/signup_page.dart';
import 'package:flutter_meditation_app/Home_Page/home_page.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/audio_screen.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/song_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///Title
      title: 'Flutter-Meditation-App',

      ///Banner
      debugShowCheckedModeBanner: false,

      //theme
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.blue,
      ),

      ///home
      home: HomePage(),

      ///routes
      routes: {
        HomePage.id: (context) => HomePage(),
        AudioPlayerScreen.id: (context) => AudioPlayerScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        // HomePage.id: (context) => HomePage(),
        // HomePage.id:(context)=> HomePage(),
      },
    );
  }
}
