import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';

class ProfileViewScreen extends StatelessWidget {
  ///id
  static final id = '/ProfileViewScreen';

  ///auth
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    ///final size
    // ignore: unused_local_variable
    final Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  elevation: 5,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(myImgLink),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {
                          print('Clicked to pick Image');
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(0.2),
                width: s.width,
                child: ListTile(
                  title: Center(child: Text("Last seen")),
                  subtitle: Center(
                      child:
                          Text("${auth.currentUser.metadata.lastSignInTime}")),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder<User>(
                    initialData: auth.currentUser,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            /*The users display name.
                            Will be null if signing in 
                            anonymously or via password authentication.*/
                            Divider(),
                            ListTile(
                              title: Text('Name'),
                              trailing: Text(
                                auth.currentUser != null
                                    ? "${auth.currentUser.displayName}"
                                    : Container(
                                        height: 2.0,
                                        width: 40.0,
                                        child: Text('Progress Indicator'),
                                      ),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('E-mail'),
                              trailing: Text("${auth.currentUser.email}"),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('Phone Number'),
                              trailing: Text(
                                  auth.currentUser.phoneNumber != null
                                      ? "${auth.currentUser.phoneNumber}"
                                      : "No number added"),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('Created on'),
                              trailing: Text(
                                  "${auth.currentUser.metadata.creationTime}"),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('Email verified'),
                              trailing: Text(
                                "${auth.currentUser.emailVerified}" == true
                                    ? "Verified"
                                    : "Not verified",
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('User Type'),
                              trailing: Text(
                                auth.currentUser.isAnonymous == true
                                    ? "Is Anonymous"
                                    : "User",
                              ),
                            ),
                          ],
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
