import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewScreen extends StatelessWidget {
  ///id
  static final id = '/ProfileViewScreen';

  ///auth
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        initialData: auth.currentUser,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name : ${snapshot.data.displayName}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Email : ${auth.currentUser.email}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Created on: ${auth.currentUser.metadata.creationTime}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Email verified : ${auth.currentUser.emailVerified}"),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
