import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Credentials_Screens/signup_page.dart';
import 'package:flutter_meditation_app/Custom_widgets/login_signup_button.dart';
import 'package:flutter_meditation_app/Custom_widgets/textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatelessWidget {
  ///final id
  static final id = '/LogInScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*********************************************
                 * HEADER
                **********************************************/
                Center(
                  child: Image.asset('images/girl.png'),
                ),

                /*********************************************
                 * SizedBox
                **********************************************/
                SizedBox(height: 50),

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
                          * Info
                          **********************************************/
                          Text(
                            'Welcome!',
                            style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                          ),
                          Text(
                            'Please Login into your account',
                            style: GoogleFonts.lateef(
                              textStyle: TextStyle(
                                fontSize: 35.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          CustomTextField(
                            txt: 'Enter Email',
                            txtClr: Colors.black,
                            prefixIcon: Icons.email,
                            iconClr: Colors.black,
                          ),
                          CustomTextField(
                            txt: 'Enter Password',
                            txtClr: Colors.black,
                            prefixIcon: Icons.lock,
                            SuffixIcon: Icons.visibility,
                            iconClr: Colors.black,
                          ),
                          /*********************************************
                          * LOGIN CUSTOM BUTTON
                          **********************************************/
                          Custom_Button(
                            txt: 'LOGIN',
                            clr: kblueClr,
                            onPress: () {},
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
