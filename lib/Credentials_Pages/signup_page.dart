import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Credentials_Pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  ///final id
  static final id = '/SingUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///Form key
  var formKey = GlobalKey<FormState>();

  ///Controllers
  TextEditingController nameC = TextEditingController();
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
            .createUserWithEmailAndPassword(
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
          userRef.child(auth.currentUser.uid).set({
            "name": nameC.text,
            "email": emailC.text,
            "password": passC.text,
          });
          Navigator.pushNamed(context, LogInScreen.id);
        }
      }
    } catch (e) {
      toastmsg(e.toString());
    }
  }

  ///Disposing Fields
  @override
  void dispose() {
    nameC.clear();
    emailC.clear();
    passC.clear();
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
    super.dispose();
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
              fit: BoxFit.fitHeight,
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
                 * 100 * 0.6 = 60
                 * this will ocupy 60 height according of every screen
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
                            'SIGNUP FORM',
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
                              controller: nameC,
                              validator: (v) {
                                if (nameC.text.length < 3) {
                                  return 'Name must be greater than 3';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                labelText: 'Enter Name',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: emailC,
                              validator: (v) {
                                if (!emailC.text.contains("@gmail.com")) {
                                  return 'Email must contain @gmail.com';
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
                                  return 'Name must be greater than 7';
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
                                'SIGNUP',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Already have account?",
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
                                    print('LOGIN NOW!');
                                    Navigator.pushNamed(
                                        context, LogInScreen.id);
                                  },
                                  child: Text(
                                    'LOGIN NOW!',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
