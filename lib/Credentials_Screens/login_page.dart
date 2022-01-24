import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Credentials_Screens/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatelessWidget {
  ///final id
  static final id = '/LogInScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          /*********************************************
           * Bg Container Img
          **********************************************/
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                loginImgLink,
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          width: double.infinity,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*********************************************
                 * HEADER
                **********************************************/
                Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome to Medito-app',
                      style: GoogleFonts.lateef(
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                /*********************************************
                 * SizedBox
                **********************************************/
                SizedBox(height: 100),

                /*********************************************
                 * Login Container
                **********************************************/
                Container(
                  decoration: BoxDecoration(
                    color: kwhiteClr,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  width: double.infinity,
                  child: Form(
                      child: Center(
                    child: Container(
                      child: Column(
                        children: [
                          /*********************************************
                          * Sized Box
                          **********************************************/
                          SizedBox(height: 30),

                          /*********************************************
                          * Info
                          **********************************************/
                          Text(
                            'Welcome!',
                            style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                              color: kblueClr,
                            )),
                          ),
                          Text(
                            'Please Login into your account',
                            style: GoogleFonts.lateef(
                              textStyle: TextStyle(
                                fontSize: 35.0,
                                color: kblueClr,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: kblueClr,
                                ),
                                labelText: 'Enter Email',
                                labelStyle: TextStyle(
                                  color: kblueClr,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: kblueClr,
                                ),
                                labelText: 'Enter Password',
                                labelStyle: TextStyle(
                                  color: kblueClr,
                                ),
                                suffixIcon: Icon(
                                  Icons.visibility,
                                  color: kblueClr,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: kblueClr,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 70,
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.lateef(
                                    textStyle: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),

                          /*********************************************
                          * SizedBox
                          **********************************************/
                          SizedBox(height: 10),
                          Text(
                            "Dont't have Account?",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return SignUpScreen();
                              }));
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                color: kblueClr,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Expa {}
