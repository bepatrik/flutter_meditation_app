import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///size
    final Size s = MediaQuery.of(context).size;

    ///Card
    return Card(
      child: Container(
        height: s.height,
        width: s.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10,
              child: Container(
                height: 100,
                width: s.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 50,
                            width: s.width,
                            child: Center(
                              child: Text(
                                "LOADING...",
                                style: GoogleFonts.lateef(
                                  textStyle: TextStyle(
                                    fontSize: 25.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                          child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: CircularProgressIndicator())),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
