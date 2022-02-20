import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Credentials_Screens/Forget_Password/forget_password.dart';
import 'package:flutter_meditation_app/Credentials_Screens/User_Login_Logout/user_activities.dart';
import 'package:flutter_meditation_app/Credentials_Screens/Login_SignUp_Screens/log_in.dart';
import 'package:flutter_meditation_app/Credentials_Screens/Login_SignUp_Screens/sign_up.dart';
import 'package:flutter_meditation_app/Home_Screen/home_screen.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/audio_screen.dart';
import 'package:flutter_meditation_app/User_Profile_Management/profile_view_screen.dart';

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

      ///UserLogInActivity
      ///Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
      home: UserLogInActivity(),

      ///routes
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        AudioPlayerScreen.id: (context) => AudioPlayerScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ForgetPassWordScreen.id: (context) => ForgetPassWordScreen(),
        UserLogInActivity.id: (context) => UserLogInActivity(),
        ProfileViewScreen.id: (context) => ProfileViewScreen(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
        // HomePage.id:(context)=> HomePage(),
      },
    );
  }
}
