import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Credentials_Screens/login_page.dart';
import 'package:flutter_meditation_app/Credentials_Screens/signup_page.dart';
import 'package:flutter_meditation_app/Home_Page/home_page.dart';
import 'package:flutter_meditation_app/Initial_Screen/splash_screen.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/audio_screen.dart';

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
      home: AudioPlayerScreen(),

      ///routes
      routes: {
        HomePage.id: (context) => HomePage(),
        AudioPlayerScreen.id: (context) => AudioPlayerScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        // HomePage.id:(context)=> HomePage(),
      },
    );
  }
}
