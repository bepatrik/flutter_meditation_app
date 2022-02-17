import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassWordScreen extends StatelessWidget {
//final id
  static final id = '/ForgetPassWordScreen';

  ///auth
  FirebaseAuth auth = FirebaseAuth.instance;

  //controllers
  TextEditingController emailC = TextEditingController();

  ///forget password method
  forgetPass(BuildContext context) {
    auth.sendPasswordResetEmail(email: emailC.text.trim());
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Reset Password Request'),
            content: Text(
              'Your request to reset the Password has been sent to your Gmail,go and check Gmail',
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Okay!'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ///size
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: s.height,
          width: s.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(bgLogInImgPage),
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
                Container(
                  height: s.height * 0.50,
                  width: s.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'FORGET PASSWORD',
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
                          controller: emailC,
                          // validator: (v) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter e-mail',
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
                            forgetPass(context);
                          },
                          child: Text(
                            'SEND REQUEST',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
