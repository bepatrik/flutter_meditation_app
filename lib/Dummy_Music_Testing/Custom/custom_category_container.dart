import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCategoryContainer extends StatelessWidget {
  String firstText;
  // Color clr;
  // Function onPress;

  CustomCategoryContainer({
    this.firstText,
    // this.clr,
    // this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage('images/bg.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text('${firstText}',
                      style: GoogleFonts.lateef(
                          textStyle: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))))
            ],
          ),
        ),
      ),
    );
  }
}
