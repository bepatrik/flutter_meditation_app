import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Credentials_Screens/log_in.dart';
import 'package:flutter_meditation_app/Credentials_Screens/sign_up.dart';
import 'package:flutter_meditation_app/Home_Screen/home_screen.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/audio_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

      ///home
      home: LogInScreen(),

      ///routes
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        AudioPlayerScreen.id: (context) => AudioPlayerScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
      },
    );
  }
}
