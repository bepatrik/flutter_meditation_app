import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Credentials_Screens/Login_SignUp_Screens/log_in.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  ///final id
  static final id = '/SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///Controllers
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  ///global key
  var globalKey = GlobalKey<FormState>();

  ///auth
  FirebaseAuth auth = FirebaseAuth.instance;

  ///SaveForm
  saveFormUser(BuildContext context) async {
    try {
      if (globalKey.currentState.validate()) {
        print(emailC.text);
        await auth.createUserWithEmailAndPassword(
          email: emailC.text.trim(),
          password: passC.text.trim(),
        );
        var user = auth.currentUser.uid;
        if (user != null) {
          await userRef.child(auth.currentUser.uid).set(
            {
              "name": nameC.text,
              "email": emailC.text,
              "password": passC.text,
            },
          ).catchError(
            (onError) {
              toastmsg(
                onError.toString(),
              );
            },
          );
          await Navigator.pushNamed(context, LogInScreen.id);
        } else if (user == null) {
          return Container(child: CircularProgressIndicator());
        } else {
          return Container(child: CircularProgressIndicator());
        }
      }
    } catch (e) {
      await toastmsg(e.toString());
    }
  }

  ///disposing
  @override
  void dispose() {
    emailC.clear();
    nameC.clear();
    passC.clear();
    emailC.dispose();
    nameC.dispose();
    passC.dispose();
    super.dispose();
  }

  ///initialing iconButton
  @override
  void initState() {
    icnBtn = Icons.visibility_off;
    isVisible = false;
    obsecure = true;
    super.initState();
  }

  ///for password eye
  bool isVisible = false;
  IconData icnBtn;
  bool obsecure = false;

  @override
  Widget build(BuildContext context) {
    ///size
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: s.height,
          width: s.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(bgSingUpImgPage),
              fit: BoxFit.fill,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: globalKey,
                  child: Container(
                    height: s.height * 0.60,
                    width: s.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'SIGNUP FORM',
                          style: GoogleFonts.lateef(
                            textStyle: TextStyle(
                              fontSize: 30.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: nameC,
                            validator: (v) {
                              try {
                                if (nameC.text.length < 3) {
                                  return 'Name should be greater than 3 words';
                                } else {
                                  return null;
                                }
                              } catch (e) {
                                return toastmsg(e.toString());
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Enter Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailC,
                            validator: (v) {
                              try {
                                if (!emailC.text.contains('@gmail.com')) {
                                  return 'Enter valid email';
                                } else if (emailC.text
                                    .contains('@gmail.com'.toUpperCase())) {
                                  return 'Please Enter valid email';
                                } else {
                                  return null;
                                }
                              } catch (e) {
                                return toastmsg(e.toString());
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              prefixIcon: Icon(Icons.email),
                              hintText: 'Enter e-mail',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passC,
                            validator: (v) {
                              try {
                                if (passC.text.length < 7) {
                                  return 'Password should be greater than 3 words';
                                } else {
                                  return null;
                                }
                              } catch (e) {
                                return toastmsg(e.toString());
                              }
                            },
                            obscureText: obsecure,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Enter Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  if (!isVisible) {
                                    setState(() {
                                      isVisible = true;
                                      obsecure = true;
                                      icnBtn = Icons.visibility_off;
                                    });
                                  } else {
                                    setState(() {
                                      isVisible = false;
                                      obsecure = false;
                                      icnBtn = Icons.visibility;
                                    });
                                  }
                                },
                                icon: Icon(icnBtn),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            shape: StadiumBorder(),
                            height: 55,
                            minWidth: s.width,
                            color: Colors.blue,
                            onPressed: () {
                              saveFormUser(context);
                            },
                            child: Text(
                              'SIGNUP',
                              style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Already have account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('LOGIN NOW'),
                            ),
                          ],
                        ),
                      ],
                    ),
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
