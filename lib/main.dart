import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Music_Player/Home_Page/dummy_homepage.dart';

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
      home: DummyHomePage(),
    );
  }
}
