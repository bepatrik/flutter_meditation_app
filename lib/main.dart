import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Home_Page/home_page.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/audio_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///Title of App
      title: 'Meditation App',

      ///DebugShowCheckedModeBanner
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
        // ResetPassword.id: (context) => ResetPassword(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
      },
    );
  }
}
