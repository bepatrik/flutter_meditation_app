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
    ///final size
    final Size s = MediaQuery.of(context).size;

    ///Scaffold
    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
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
            Card(
              elevation: 2,
              child: Container(
                height: s.height * 0.6,
                width: s.width,
                child: Center(
                    child: Form(
                        child: Column(
                  children: [
                    Text('LOGIN',
                        style: GoogleFonts.lateef(
                          textStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Enter Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Enter Password',
                          suffixIcon: Icon(Icons.visibility),
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
                        child: Text('LOGIN',
                            style: GoogleFonts.lateef(
                              textStyle: TextStyle(
                                fontSize: 25.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        onPressed: () {},
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Forget Password?',
                          style: GoogleFonts.lateef(
                            textStyle: TextStyle(
                              fontSize: 20.5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Don't have account?",
                              style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                                  fontSize: 20.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        )),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignUpScreen.id);
                            },
                            child: Text('REGISTER ACCOUNT',
                                style: GoogleFonts.lateef(
                                  textStyle: TextStyle(
                                    fontSize: 20.5,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
