import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Credentials_Screens/log_in.dart';
import 'package:flutter_meditation_app/Home_Screen/home_screen.dart';
import 'package:flutter_meditation_app/Widgets/loading_effect.dart';

// ignore: must_be_immutable
class UserLogInActivity extends StatelessWidget {
  //final id
  static final id = '/UserLogInActivity';

  ///screen loading
  bool isLoading = false;

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
      body: isLoading == false
          ? FutureBuilder<User>(
              ///Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
              initialData: auth.currentUser,
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: LoadingEffect());
                }
                if (snapshot.data != null) {
                  // ignore: unused_local_variable
                  User user = snapshot.data;
                  return HomeScreen();
                } else {
                  return LogInScreen();
                }
              },
            )

          ///if Loading effect is true than it will show the effect
          : LoadingEffect(),
    );
  }
}
