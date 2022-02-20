import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Home_Screen/home_screen.dart';

class AuthProvider {
  // ignore: missing_return
  Future<bool> loginWithPhone(BuildContext context, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpController = TextEditingController();

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User user = result.user;

          if (user != null) {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
            toastmsg('Successfully Logged in!');
          } else {
            toastmsg("User Does'nt Exists!");
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          toastmsg(e.toString());
        },
        codeSent: (String verificationCode, int token) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Enter OTP'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: otpController,
                      ),
                    ],
                  ),
                  actions: [
                    MaterialButton(
                      color: Colors.red,
                      child: Text(
                        'Verify',
                      ),
                      onPressed: () async {
                        final code = otpController.text;
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationCode,
                                smsCode: code);
                        UserCredential result =
                            await _auth.signInWithCredential(credential);
                        User user = result.user;
                        if (user != null) {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.id);
                          toastmsg('Successfully Logged in!');
                        } else {
                          toastmsg('Error!');
                        }
                      },
                    ),
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) {
          return null;
        });
  }
}
