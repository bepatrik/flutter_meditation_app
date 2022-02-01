import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Credentials_Pages/signup_page.dart';

class SplashScreen extends StatefulWidget {
  ///Final id
  static final id = '/SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ///timer var
  Timer _timer;

  ///Timer
  @override
  void initState() {
    _timer = Timer(Duration(seconds: 3), () async {
      await Navigator.pushReplacementNamed(context, SignUpScreen.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Final size
    final Size s = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              splashImgBg,
            ),
            fit: BoxFit.fill,
          ),
        ),
        height: s.height,
        width: s.width,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    'Work on this page is pending',
                    style: TextStyle(
                      fontSize: 25.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
