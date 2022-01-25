import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Button extends StatelessWidget {
  ///Var
  String txt;

  ///Const
  Custom_Button({this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: kblueClr,
          borderRadius: BorderRadius.circular(50),
        ),
        height: 70,
        child: Center(
          child: Text(
            "${txt}",
            style: GoogleFonts.lateef(
              textStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
