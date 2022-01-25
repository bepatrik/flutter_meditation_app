import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String txt;
  IconData prefixIcon;
  IconData SuffixIcon;
  Color iconClr;
  Color txtClr;

  CustomTextField({
    this.txt,
    this.prefixIcon,
    this.SuffixIcon,
    this.iconClr,
    this.txtClr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: iconClr,
          ),
          labelText: "${txt}",
          labelStyle: TextStyle(
            color: txtClr,
          ),
          suffixIcon: Icon(
            SuffixIcon,
            color: iconClr,
          ),
        ),
      ),
    );
  }
}
