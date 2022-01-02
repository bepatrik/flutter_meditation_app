import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Main_Screens/displaysongs.dart';
import 'package:flutter_meditation_app/Main_Screens/main_screen.dart';

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
        scaffoldBackgroundColor: Colors.black,
      ),

      ///home
      home: CategoryScreen(),
    );
  }
}
