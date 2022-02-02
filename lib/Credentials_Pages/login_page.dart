import 'dart:ui';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Home_Page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class LogInScreen extends StatefulWidget {
  ///final id
  static final id = '/LogInScreen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ///Form key
  var formKey = GlobalKey<FormState>();

  ///Controllers
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  ///Let's create object firebaseAuth
  FirebaseAuth auth = FirebaseAuth.instance;

/*********************************************
 * SAVEFORM METHOD
 * We'll make it in Try and Catch method
 * it will save app from crash
**********************************************/
  saveForm(BuildContext context) async {
    try {
      if (formKey.currentState.validate()) {
        print(emailC.text);
        await auth
            .signInWithEmailAndPassword(
          email: emailC.text.trim(),
          password: passC.text.trim(),
        )
/*********************************************
 * This will catch error
 * Error will be shown in toast
**********************************************/
            .catchError((errorMsg) {
          toastmsg(errorMsg.toString());
        });
        var u = auth.currentUser.uid;
        if (u != null) {
          Navigator.pushReplacementNamed(
            context,
            HomePage.id,
          );
        }
      }
    } catch (e) {
      toastmsg(e.toString());
    }
  }

  ///Disposing Fields
  @override
  void dispose() {
    emailC.clear();
    passC.clear();
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

/*********************************************
 * Login With Google Method
**********************************************/
  void loginWithGoogle() async {
    try {
      GoogleSignIn gsn = GoogleSignIn();
      await gsn.signIn();
      Navigator.pushReplacementNamed(context, HomePage.id);
    } catch (e) {
      toastmsg(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    ///final size
    final Size s = MediaQuery.of(context).size;

    ///Scaffold
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  /********************************************
       * Using MediaQuery
       * Which will make Responsive Deisgn 
       * According to Screen
       * s.height (height of screen 100)
       * 100 * 0.5 = 50
       * this will ocupy 50 height according of every screen
      **********************************************/
                  height: s.height * 0.6,
                  width: s.width,
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: emailC,
                              validator: (v) {
                                if (!emailC.text.contains("@gmail.com")) {
                                  return 'Wrong email';
                                } else {
                                  return null;
                                }
                              },
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
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: passC,
                              validator: (v) {
                                if (passC.text.length < 7) {
                                  return 'Wrong Password';
                                } else {
                                  return null;
                                }
                              },
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
                            padding: EdgeInsets.all(8.0),
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
                              onPressed: () {
                                saveForm(context);
                              },
                            ),
                          ),
                          Center(
                            child: Text('OR'),
                          ),
                          GoogleAuthButton(
                            onPressed: () {
                              loginWithGoogle();
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
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
                                    print('REGISTER ACCOUNT');
                                    Navigator.pop(context);
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
      ),
    );
  }
}
