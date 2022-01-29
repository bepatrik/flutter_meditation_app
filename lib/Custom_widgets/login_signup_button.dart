import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Button extends StatelessWidget {
  ///Var
  String txt;
  Color clr;
  Function onPress;

  ///Const
  Custom_Button({
    this.txt,
    this.clr,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: clr,
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
      ),
    );
  }
}
