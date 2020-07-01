import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  final title;
  final bgColor;
  final textColor;
  MenuItem({this.title, this.bgColor, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: bgColor,
          child: new Text("🗂"),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          title,
          style: GoogleFonts.lato(
              fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }
}
