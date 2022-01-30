import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Credentials_Screens/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  ///final id
  static final id = '/LogInScreen';

  ///Form key
  final GlobalKey formKey = GlobalKey<FormState>();

  ///Controllers
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ///final size
    final Size s = MediaQuery.of(context).size;

    ///Scaffold
    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
/*********************************************
 * PROPERTY DECORATION IMAGE
 * TO MAKE BACKGROUND IMAGE
 * IMAGE IS FROM NETWORK
**********************************************/
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              bgLogInImgPage,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: s.height * 0.5,
                width: s.width,
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOGIN FORM',
                          style: GoogleFonts.lateef(
                            textStyle: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailC,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              labelText: 'Enter Email',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passC,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              labelText: 'Enter Password',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            shape: StadiumBorder(),
                            height: 65,
                            minWidth: s.width,
                            color: Colors.blue,
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                                  fontSize: 25.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Forget Password?',
                              style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                                  fontSize: 20.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Don't have account?",
                                  style: GoogleFonts.lateef(
                                    textStyle: TextStyle(
                                      fontSize: 20.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, SignUpScreen.id);
                                },
                                child: Text(
                                  'REGISTER ACCOUNT',
                                  style: GoogleFonts.lateef(
                                    textStyle: TextStyle(
                                      fontSize: 20.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
