import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Center(
              child: Text(
                'Drawer Header',
                style: GoogleFonts.adamina(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Icon(Icons.music_note),
              title: Text('Home'),
              subtitle: Text('Songs to play'),
              trailing: Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }
}
