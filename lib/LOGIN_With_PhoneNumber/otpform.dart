import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/LOGIN_With_PhoneNumber/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPFormScreen extends StatefulWidget {
  ///final
  static final id = '/OTPFormScreen';

  @override
  State<OTPFormScreen> createState() => _OTPFormScreenState();
}

class _OTPFormScreenState extends State<OTPFormScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController inputController = TextEditingController();

  @override
  void dispose() {
    inputController.clear();
    inputController.dispose();
    super.dispose();
  }

  saveForm() {
    if (formKey.currentState.validate()) {
      if (inputController.text != null) {
        final phone = '+92' + inputController.text;
        AuthProvider().loginWithPhone(
          context,
          phone,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ///final size
    // ignore: unused_local_variable
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
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
                            'LOGIN WITH PHONE NUMBER',
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
                              validator: (v) {
                                if (inputController.text.isEmpty) {
                                  return 'Should not be empty';
                                } else {
                                  return null;
                                }
                              },
                              controller: inputController,
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
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              shape: StadiumBorder(),
                              height: 55,
                              minWidth: s.width,
                              color: Colors.blue,
                              onPressed: () {
                                saveForm();
                              },
                              child: Text(
                                'Send OTP',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
