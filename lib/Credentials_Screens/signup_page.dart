import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Customs/login_signup_button.dart';
import 'package:flutter_meditation_app/Customs/textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  ///final id
  static final id = '/SingUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
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
                      topLeft: Radius.circular(150),
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
                            'SIGNUP!',
                            style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                          ),
                          Text(
                            'Create your account',
                            style: GoogleFonts.lateef(
                              textStyle: TextStyle(
                                fontSize: 35.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          CustomTextField(
                            txt: 'Enter Name',
                            txtClr: Colors.black,
                            prefixIcon: Icons.person,
                            iconClr: Colors.black,
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
                            txt: 'SIGNUP',
                            clr: Colors.blue,
                            onPress: () {},
                          ),

                          /*********************************************
                          * SizedBox
                          **********************************************/
                          SizedBox(height: 10),
                          Text(
                            "Already have Account?",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login Now!',
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
