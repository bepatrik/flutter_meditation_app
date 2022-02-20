import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/User_Profile_Management/profile_view.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: ProfileView(),
          ),
          Card(
            child: ListTile(
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Icon(Icons.home),
              title: Text('HOME'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
