import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:flutter_meditation_app/Credentials_Screens/Login_SignUp_Screens/log_in.dart';
import 'package:flutter_meditation_app/Home_Screen/home_screen.dart';

// ignore: must_be_immutable
class UserLogInActivity extends StatelessWidget {
  //final id
  static final id = '/UserLogInActivity';

  ///Auth
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ///size
    // ignore: unused_local_variable
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      /*Creates a widget that builds itself based on the latest snapshot of interaction
      with a [Future]. The [builder] must not be null.*/
      body: FutureBuilder<User>(
        ///Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
        initialData: auth.currentUser,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          ///Connected to an asynchronous computation and awaiting interaction.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          /*Returns whether this snapshot contains a non-null [error] value.
        This is always true if the asynchronous computation's last result was failure.*/
          if (snapshot.hasError) {
            return toastmsg(snapshot.error.toString());
          }
          /* The latest data received by the asynchronous computation.
        If this is non-null, [hasData] will be true.
        If [error] is not null, this will be null. See [hasError].
        If the asynchronous computation has never returned a value,
        this may be set to an initial data value specified by the relevant widget.
        See [FutureBuilder.initialData] and [StreamBuilder.initialData].*/
          if (snapshot.data != null) {
            User user = snapshot.data;
            return HomeScreen();
          } else {
            return LogInScreen();
          }
        },
      ),
    );
  }
}
